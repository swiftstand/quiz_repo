import mysql from 'mysql2';

export default class DatabaseHandler {
    constructor(config) {
      this.connection = mysql.createConnection(config);
    }
  
    connect() {
      this.connection.connect((err) => {
        if (err) {
          console.error('Error connecting to the database:', err.stack);
        } else {
          console.log('Connected to the database as id ' + this.connection.threadId);
        }
      });
    }
  
    disconnect() {
      this.connection.end((err) => {
        if (err) {
          console.error('Error disconnecting from the database:', err.stack);
        } else {
          console.log('Disconnected from the database');
        }
      });
    }
  
    queryTable(tableName, callback) {
      const query = `SELECT * FROM ${tableName}`;
      this.connection.query(query, (err, results) => {
        if (err) {
          console.error(`Error querying table ${tableName}:`, err.stack);
          callback(err, null);
        } else {
          console.log(`Results from table ${tableName}:`, results);
          callback(null, results);
        }
      });
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
  
    queryQuizDetails(quizId, callback) {
      const quizQuery = 'SELECT * FROM quiz WHERE quiz_id = ?';
      this.connection.query(quizQuery, [quizId], (err, quizResults) => {
        if (err) {
          console.error(`Error querying quiz with id ${quizId}:`, err.stack);
          return callback(err, null);
        }
  
        if (quizResults.length === 0) {
          return callback(null, { quiz: null, questions: [] });
        }
  
        const quiz = quizResults[0];
        const questionQuery = 'SELECT * FROM question WHERE quiz_id = ?';
        this.connection.query(questionQuery, [quizId], (err, questionResults) => {
          if (err) {
            console.error(`Error querying questions for quiz_id ${quizId}:`, err.stack);
            return callback(err, null);
          }
  
          const questions = questionResults;
          const questionIds = questions.map(q => q.question_id);
          
          if (questionIds.length === 0) {
            return callback(null, { quiz, questions: [] });
          }
  
          const optionQuery = 'SELECT * FROM learnfir_quiz_db.option WHERE question_id IN (?)';
          this.connection.query(optionQuery, [questionIds], (err, optionResults) => {
            if (err) {
              console.error(`Error querying options for questions:`, err.stack);
              return callback(err, null);
            }
  
            // Group options by question_id
            const optionsByQuestionId = optionResults.reduce((acc, option) => {
              if (!acc[option.question_id]) {
                acc[option.question_id] = [];
              }
              acc[option.question_id].push(option);
              return acc;
            }, {});

  
            // Attach options to their respective questions
            questions.forEach(question => {
                const questionOptions= optionsByQuestionId[question.question_id] || []
                let questionAnswer= []
                questionOptions.forEach(opt => {
                    if (opt.is_correct===1){
                        questionAnswer.push(opt.option_text)
                    }
                })
              question.numb= question.question_id
              question.question= question.question_text
              question.answers= questionAnswer
              question.options = questionOptions;
            });
  
            callback(null, { quiz, questions });
          });
        });
      });
    }
  }
  