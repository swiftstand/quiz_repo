import express from "express";
import path from 'path';
import { fileURLToPath } from 'url';
import DatabaseHandler from "./utils/DatabaseHandler";
import { DB_CREDENTIALS } from "./utils/config";

// const dbHandler = new DatabaseHandler(DB_CREDENTIALS)

// const dbHandler = new DatabaseHandler({
//   host: process.env.DB_HOST,
//   user: process.env.DB_USER,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_NAME,
// });
// Connect to the database
// dbHandler.connect();


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
  // res.sendFile(path.join(__dirname, 'templates', 'index.html'));
  const context = { message: "Hello from the Quiz!" };
    res.render('index', context);
});

server.get("/quiz", (req, res) => {
    const query = req.query;
    const passedUrl= `/?passed=${query.endpoint}`

    const context = { message: JSON.stringify("myQuestions"), endpoint: passedUrl, myHost: req.headers.host};
    console.log(context)
    res.render('quiz', context);
    // const quizQuestions= dbHandler.queryQuizDetails(Number(query.code || 1), (err, results) => {
    //   if (err) {
    //     console.error('Error querying quiz details:', err);
    //   } else {
    //     const context = { message: JSON.stringify(results), endpoint: passedUrl, myHost: req.headers.host};
    //     console.log(context)
    //     res.render('quiz', context);
    //   }
    
    //   // Disconnect from the database
    //   // dbHandler.disconnect();
    // });

    
});


server.listen(PORT, '0.0.0.0',  () => {
  console.log("MY Server Running on..", PORT, "-", process.env.HOST);
});
