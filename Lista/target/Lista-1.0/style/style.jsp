<style>
*
{
margin: 0;
padding: 0; 
box-sizing: border-box;
font-family: 'Poppins',sans-serif;
}

.header
{
position: fixed; 
width: 100%;
height: 60px;
display: flex; 
justify-content: space-between; 
align-items: center; 
padding: 20px 100px;
z-index: 99;
background: transparent;
}


.background
{
    width: 100%;
    height: 100vh;
    background-image: url('img/fondo.jpg'); 
    background-position: center;
    background-size: cover;
    } 
    
.home   
    {
    position: absolute;  
    top: 50%;
    left: 50%; 
    width: 75%;
    height: 75%;
    transform: translate(-50%, -50%);
    background-image: url('img/fondo.jpg');
    background-position: center;
    background-size: cover;
    display: flex;
    margin-top: 10px; 
    border: 1px solid black;
    border-radius: 10px; 
    border: none;
    }

.content
{
display: flex;
flex-direction: column; 
width: 700px; 
padding: 100px 0;
}

.content a
{
position: relative; 
text-decoration: none; 
color: #fff; 
font-size: 3em; 
font-weight: 700;
top: -40px;
Left: 80px;
}

.content h2
{
font-size: 3.5em; 
text-align: center; 
color: #fff;
}

.content h3
{
font-size: 2em;
text-align: center; 
color: #fff;
}

.content pre
{
margin-top: 20px;
text-align: center; 
font-size: 1em; 
color: #fff;
}

.content .icon
{
margin-top: 20px;
font-size: 1.5em; 
display: flex; 
justify-content: center;
} 

.content .icon i
{
margin-left: 20px; 
color: #fff;
}

.login
{
width: 500px; 
position: relative; 
padding: 80px 30px; 
backdrop-filter: blur(20px);
}

.login h2
{
font-size: 2em; 
text-align: center; 
margin-bottom: 30px; 
color: #fff;
}

.login .input
{
position: relative; 
width: 100%; 
height: 30px; 
margin-bottom: 50px
}

.login .sign-up
{
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}

.login .sign-up a
{
    display: block;
    text-decoration: none;
    color: #fff;
    font-weight: 700;
}
.login .sign-up p
{
    display: block;
    color: #fff;
    margin-right: 10px;
}

.sign-up a:hover
{
    text-decoration: underline;
}

.login .input .input1
{
font-size: 16px;
display: flex;
flex-direction: column; 
justify-content: center; 
align-items: center; 
background: transparent; 
border: none; 
outline: none;
border-bottom: 2px solid #fff;
color: #fff;
width: 100%;
height: 100%;
}

::placeholder
{
color: #fff; 
font-size: 18px;
}

.login .input i
{
position: relative;
right: -370px;
bottom: 27px;
color: #fff;
}

.check
{
display: flex;
justify-content: space-between; 
margin-bottom: 40px; 
color: #fff;
}

.check a{
    text-decoration: none;
    color: #fff;
}

.check a:hover
{
    text-decoration: underline;
}

.login .button
{
    width: 100%;
    height: 40px;
    margin-bottom: 15px;
}

button
{
    width: 100%;
    height: 40px;
    background-color: #025940 !important;
    border: none;
    outline: none;
    font-size: 20px;
    font-weight: 700;
    border-radius: 7px;
    color: #fff !important;
}

button:active
{
    font-size: 25px;
}
</style>
