import express from "express";
import path from 'path';
import { fileURLToPath } from 'url';

import mysql from 'mysql2/promise';

export default class DatabaseHandler {
  constructor(config) {
    this.config = config;
    this.pool = mysql.createPool({
      ...config,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
      connectTimeout: 30000 // 10 seconds
    });
    this.maxRetries = 5; // Maximum retries for connection
  }

  async connect() {
    try {
      // Test connection to ensure pool is working
      await this.pool.getConnection();
      console.log('Connected to the database');
    } catch (err) {
      console.error('Error connecting to the database:', err.stack);
    }
  }

  async disconnect() {
    try {
      await this.pool.end();
      console.log('Disconnected from the database');
    } catch (err) {
      console.error('Error disconnecting from the database:', err.stack);
    }
  }

  async queryDatabase(query, params = [], retries = this.maxRetries) {
    while (retries) {
      try {
        const [results] = await this.pool.query(query, params);
        return results;
      } catch (err) {
        if (err.code === 'ETIMEDOUT' || err.code === 'ECONNRESET' || err.code === 'PROTOCOL_CONNECTION_LOST') {
          retries -= 1;
          console.log(`Retrying query... (${this.maxRetries - retries}/${this.maxRetries})`);
          await new Promise(res => setTimeout(res, 2000)); // wait for 2 seconds before retrying
          if (retries === 0) throw new Error('Max retries reached. Could not connect to the database.');
        } else {
          throw err;
        }
      }
    }
  }

  async queryTable(tableName, callback) {
    const query = `SELECT * FROM ${tableName}`;
    try {
      const results = await this.queryDatabase(query);
      console.log(`Results from table ${tableName}:`, results);
      callback(null, results);
    } catch (err) {
      console.error(`Error querying table ${tableName}:`, err.stack);
      callback(err, null);
    }
  }

  queryOptions(callback) {
    this.queryTable('learnfir_quiz_db.option', callback);
  }

  queryQuizzes(callback) {
    this.queryTable('quiz', callback);
  }

  queryQuestions(callback) {
    this.queryTable('question', callback);
  }

  async queryQuizDetails(quizId) {
    const quizQuery = 'SELECT * FROM quiz WHERE quiz_id = ?';
    try {
      const quizResults = await this.queryDatabase(quizQuery, [quizId]);
  
      if (quizResults.length === 0) {
        return { quiz: null, questions: [] };
      }
  
      const quiz = quizResults[0];
      const questionQuery = 'SELECT * FROM question WHERE quiz_id = ?';
      const questionResults = await this.queryDatabase(questionQuery, [quizId]);
  
      const questions = questionResults;
      const questionIds = questions.map(q => q.question_id);
  
      if (questionIds.length === 0) {
        return { quiz, questions: [] };
      }
  
      const optionQuery = 'SELECT * FROM learnfir_quiz_db.option WHERE question_id IN (?)';
      const optionResults = await this.queryDatabase(optionQuery, [questionIds]);
  
      const optionsByQuestionId = optionResults.reduce((acc, option) => {
        if (!acc[option.question_id]) {
          acc[option.question_id] = [];
        }
        acc[option.question_id].push(option);
        return acc;
      }, {});
  
      questions.forEach(question => {
        const questionOptions = optionsByQuestionId[question.question_id] || [];
        let questionAnswer = [];
        questionOptions.forEach(opt => {
          if (opt.is_correct === 1) {
            questionAnswer.push(opt.option_text);
          }
        });
        question.numb = question.question_id;
        question.question = question.question_text;
        question.answers = questionAnswer;
        question.options = questionOptions;
      });
  
      return { quiz, questions };
    } catch (err) {
      console.error(`Error querying quiz with id ${quizId}:`, err.stack);
      throw err;
    }
  }
}

  

const dbHandler = new DatabaseHandler({
  host: 'www.learnfirstquiz.com.ng',
  user: 'learnfir_manager',
  password: 'KO{F&1iNVl!A',
  database: 'learnfir_quiz_db',
  port: 3306,
})

dbHandler.connect()

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const server = express();

// Set the view engine to EJS
server.set('view engine', 'ejs');
// Set the views directory
server.set('views', path.join(__dirname, 'views'));

server.use(express.json());

// Define the port number
const PORT = process.env.PORT || 5000;

server.use(express.static(path.join(__dirname, 'public')));
server.get("/", (req, res) => {
  const context = { message: "Hello from the Quiz!" };
    res.render('index', context);
});

server.get("/quiz", async (req, res) => {
  const query = req.query;
  const passedUrl = `/?passed=${query.endpoint}`;

  // Validate input
  if (!query.code) {
      return res.status(400).send('No Quiz code was passed');
  }

  try {
      // Promisify the query method
      const results = await dbHandler.queryQuizDetails(query.code);

      if (results.quiz == null) {
          return res.status(404).send(`Invalid Quiz code: ${query.code}`);
      }

      const context = { message: JSON.stringify(results), endpoint: passedUrl, myHost: req.headers.host };
      res.render('quiz', context);
  } catch (error) {
      console.error('Unexpected error:', error);
      res.status(500).json({ error: 'Unexpected error occurred' });
  }
});



server.listen(PORT, '0.0.0.0',  () => {
  console.log("MY Server Running on..", PORT, "-", process.env.HOST);
});
