//selecting all required elements
const start_btn = document.querySelector(".start_btn button");
const info_box = document.querySelector(".info_box");
const exit_btn = info_box.querySelector(".buttons .quit");
const continue_btn = info_box.querySelector(".buttons .restart");
const quiz_box = document.querySelector(".quiz_box");
const result_box = document.querySelector(".result_box");
const option_list = document.querySelector(".option_list");
const time_line = document.querySelector("header .time_line");
const timeText = document.querySelector(".timer .time_left_txt");
const timeCount = document.querySelector(".timer .timer_sec");

const submit_btn = document.querySelector("footer .submit_btn");

const que_list = document.querySelector(".que_list");
const myQuestions= JSON.parse(que_list.innerHTML).questions.slice(0, 6)

const endpoint_url = document.querySelector(".endpoint").innerHTML
const mainHost = document.querySelector(".host").innerHTML

function randomSortObjects(a, b) {
    return Math.random() - 0.5; // Returns a random number between -0.5 and 0.5
}

myQuestions.sort(randomSortObjects);

const pickedList = {};

// if startQuiz button clicked
start_btn.onclick = ()=>{
    info_box.classList.add("activeInfo"); //show info box
}


// if continueQuiz button clicked
continue_btn.onclick = ()=>{
    info_box.classList.remove("activeInfo"); //hide info box
    quiz_box.classList.add("activeQuiz"); //show quiz box
    showQuetions(0); //calling showQestions function
    queCounter(1); //passing 1 parameter to queCounter
    startTimer(50); //calling startTimer function
    startTimerLine(0); //calling startTimerLine function
}

let timeValue =  15;
let que_count = 0;
let que_numb = 1;
let userScore = 0;
let counter;
let counterLine;
let widthValue = 0;

const restart_quiz = result_box.querySelector(".buttons .restart");
const quit_quiz = result_box.querySelector(".buttons .quit");

// if restartQuiz button clicked
restart_quiz.onclick = ()=>{
    quiz_box.classList.add("activeQuiz"); //show quiz box
    result_box.classList.remove("activeResult"); //hide result box
    timeValue = 15; 
    que_count = 0;
    que_numb = 1;
    userScore = 0;
    widthValue = 0;
    showQuetions(que_count); //calling showQestions function
    queCounter(que_numb); //passing que_numb value to queCounter
    clearInterval(counter); //clear counter
    clearInterval(counterLine); //clear counterLine
    startTimer(timeValue); //calling startTimer function
    startTimerLine(widthValue); //calling startTimerLine function
    timeText.textContent = "Time Left"; //change the text of timeText to Time Left
    next_btn.classList.remove("show"); //hide the next button
    submit_btn.classList.add("show"); //show the submit button
}

// if quitQuiz button clicked
quit_quiz.onclick = ()=>{
    window.location.href = endpoint_url ////reload the current window
}

const currentDomain = window.location.hostname;

const next_btn = document.querySelector("footer .next_btn");
const bottom_ques_counter = document.querySelector("footer .total_que");

// if Next Que button clicked
next_btn.onclick = ()=>{
    if(que_count < myQuestions.length - 1){ //if question count is less than total question length
        que_count++; //increment the que_count value
        que_numb++; //increment the que_numb value
        showQuetions(que_count); //calling showQestions function
        queCounter(que_numb); //passing que_numb value to queCounter
        clearInterval(counter); //clear counter
        clearInterval(counterLine); //clear counterLine
        startTimer(timeValue); //calling startTimer function
        startTimerLine(widthValue); //calling startTimerLine function
        timeText.textContent = "Time Left"; //change the timeText to Time Left
        next_btn.classList.remove("show"); //hide the next button
        submit_btn.classList.add("show"); //show the submit button
    }else{
        clearInterval(counter); //clear counter
        clearInterval(counterLine); //clear counterLine
        showResult(); //calling showResult function
    }
}

// getting questions and options from array
function showQuetions(index){
    const que_text = document.querySelector(".que_text");

    // Question Submit button 
    submit_btn.classList.add("show");
    submit_btn.style.backgroundColor = '#2c563a'
    submit_btn.style.borderColor = '#2c563a'
    submit_btn.setAttribute("onclick", `optionSelected(${index})`)
    

    pickedList[index] = {'text': [], 'element': []}

    //creating a new span and div tag for question and option and passing the value using array index
    let que_tag = '<span>'+ myQuestions[index].numb + ". " + myQuestions[index].question +'</span>';
    let option_tag = myQuestions[index].options.reduce((accumulator, currentValue) => {
        return accumulator + '<div class="option"><span>'+ currentValue.option_text +'</span></div>'
    }, "");
    
    que_text.innerHTML = que_tag; //adding new span tag inside que_tag
    option_list.innerHTML = option_tag; //adding new div tag inside option_tag
    
    const option = option_list.querySelectorAll(".option");

    // set onclick attribute to all available options
    for(i=0; i < option.length; i++){
        option[i].setAttribute("onclick", `optionPicked(this, ${index})`);
    }
}

function optionPicked(answer, index){
    let userAns = answer.textContent || answer.innerText;

    if (pickedList[index]['text'] && !pickedList[index]['text'].includes(userAns.trim())) {
        answer.style.borderWidth = 'thick'
        answer.style.borderColor = '#dddd19'
        pickedList[index]['text'].push(userAns.trim());
        pickedList[index]['element'].push(answer);
    } else {
        answer.style.borderColor = 'transparent'
        let answer_text_index= pickedList[index]['text'].indexOf(userAns.trim())

        pickedList[index]['text'].splice(answer_text_index);
        pickedList[index]['element'].splice(answer_text_index);
    }
}
// creating the new div tags which for icons
let tickIconTag = '<div class="icon tick"><i class="fas fa-check"></i></div>';
let crossIconTag = '<div class="icon cross"><i class="fas fa-times"></i></div>';

//if user clicked on option
function optionSelected(queIndex){
    let userAns = pickedList[queIndex]['element']; //getting user selected options
    let AnsText = pickedList[queIndex]['text']; //getting user selected options
    let correcAns = myQuestions[que_count].answers; //getting correct answers array

    clearInterval(counter); //clear counter
    clearInterval(counterLine); //clear counterLine
    
    const allOptions = option_list.children.length; //getting all option items
    let queScore = 1
    userAns.map(selectedAns => {
        if(correcAns.includes(selectedAns.textContent)){ //if user selected option is equal to array's correct answer
            selectedAns.classList.add("correct"); //adding green color to correct selected option
            selectedAns.insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to correct selected option
            console.log("Correct Answer");
        } else {
            queScore= 0 //make question score zero when one of the selected option is wrong
            selectedAns.classList.add("incorrect"); //adding red color to correct selected option
            selectedAns.insertAdjacentHTML("beforeend", crossIconTag); //adding cross icon to correct selected option
            console.log("Wrong Answer = ");
        }
    })

    userScore += queScore
    console.log("Your correct answers = " + userScore, (userScore/myQuestions.length)*100);

    for(i=0; i < allOptions; i++){
        if(correcAns.includes(option_list.children[i].textContent) && !AnsText.includes(option_list.children[i].textContent.trim())){ //if there is an option which is matched to an array answer 
            option_list.children[i].setAttribute("class", "option correct"); //adding green color to matched option
            option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to matched option
        }
    }

    for(i=0; i < allOptions; i++){
        option_list.children[i].classList.add("disabled"); //once user select an option then disabled all options
    }
    next_btn.classList.add("show"); //show the next button if user selected any option
    submit_btn.classList.remove("show"); //remove the submit button
}

function showResult(){
    const scoreText = result_box.querySelector(".score_text");
    if ((userScore/myQuestions.length)*100 >= 70){ // if user scored more than 3
        //creating a new span tag and passing the user score number and total question number
        let scoreTag = '<span>and congrats! 🎉, You got <p>'+ Number((userScore/myQuestions.length)*100).toFixed(2) +'% of the questions correct</p></span>';
        scoreText.innerHTML = scoreTag;  //adding new span tag inside score_Text
        quit_quiz.innerHTML = "Go To Website"
    }
    else{ // if user scored less than 1
        let scoreTag = '<span>and sorry 😐, You got less than 70% of the questions wrong</span>';
        quit_quiz.setAttribute('onclick', `window.location.href = 'http://${mainHost}';`);
        scoreText.innerHTML = scoreTag;
    }
    info_box.classList.remove("activeInfo"); //hide info box
    quiz_box.classList.remove("activeQuiz"); //hide quiz box
    result_box.classList.add("activeResult"); //show result box   
}

function startTimer(time){
    counter = setInterval(timer, 1000);
    function timer(){
        timeCount.textContent = time; //changing the value of timeCount with time value
        time--; //decrement the time value
        if(time < 9){ //if timer is less than 9
            let addZero = timeCount.textContent; 
            timeCount.textContent = "0" + addZero; //add a 0 before time value
        }
        if(time < 0){ //if timer is less than 0
            clearInterval(counter); //clear counter
            timeText.textContent = "Time Off"; //change the time text to time off
            const allOptions = option_list.children.length; //getting all option items
            let correcAns = myQuestions[que_count].answer; //getting correct answer from array
            for(i=0; i < allOptions; i++){
                if(option_list.children[i].textContent == correcAns){ //if there is an option which is matched to an array answer
                    option_list.children[i].setAttribute("class", "option correct"); //adding green color to matched option
                    option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag); //adding tick icon to matched option
                }
            }
            for(i=0; i < allOptions; i++){
                option_list.children[i].classList.add("disabled"); //once user select an option then disabled all options
            }
            next_btn.classList.add("show"); //show the next button if user selected any option    
            submit_btn.classList.remove("show"); //remove the submit button
        }
    }
}

function startTimerLine(time){
    counterLine = setInterval(timer, 29);
    function timer(){
        time += 1; //upgrading time value with 1
        time_line.style.width = time + "px"; //increasing width of time_line with px by time value
        if(time > 549){ //if time value is greater than 549
            clearInterval(counterLine); //clear counterLine
        }
    }
}

function queCounter(index){
    //creating a new span tag and passing the question number and total question
    let totalQueCounTag = '<span><p>'+ index +'</p> of <p>'+ myQuestions.length +'</p> Questions</span>';
    bottom_ques_counter.innerHTML = totalQueCounTag;  //adding new span tag inside bottom_ques_counter
}