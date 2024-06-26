<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Flex.aspx.cs" Inherits="Flex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Main</title>

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
    /*
    font-family: "Roboto Mono", monospace;
    */
        }

        body {
                background: url("abstfac.jpg") no-repeat;
        }

        .intro{
            position: fixed;
            z-index: 3;
            left: 0;
            top: 0;
            width: 100%;
            height: 100vh;
            background-color: #161616;
            transition: 1s;
        }

.logo-header{
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #ffffff;
}

.logo{
    position: relative;
    top: 60px;
    display: inline-block;
    bottom: -20px;
    opacity: 0;

}

.logo.active{
    bottom: 0;
    opacity: 1;
    transition: ease-in-out 0.5s;
}

.logo.fade{
    bottom: 150px;
    opacity: 0;
    transition: ease-in-out 0.5s;
}

 nav {
    background-color: black;
    opacity: 40%;
    height: 60px;
    width: 100%;
    position: absolute;
    top: 0;
    z-index: 2;
  }
  
  nav .navigation {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%;
  }
  /*
  nav .logo {
    color: white;
    font-size: 24px;
    font-weight: bold;
    margin-left: 20px;
  }
  */
  
  nav .navbar ul {
    display: flex;
    list-style-type: none;
    margin: 0;
    padding: 0;
  }
  
  nav .navbar li {
    margin-right: 20px;
  }
  
  nav .navbar a {
    color: white;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    padding: 5px;
  }
  
  nav .navbar a:hover {
    color: black;
  }
  
  nav .navbar li:last-child {
    margin-right: 15px;
  }
  
  nav .navbar li:last-child a {
    background-color: black;
    color: white;
    border-radius: 15px;
    padding: 10px 20px;
    transition: all 0.3s ease;
  }
  
  nav .navbar li:last-child a:hover {
    background-color: black;
    color: lightblue;
    transform: scale(1.7);
    box-shadow: 2px 2px 5px black;
    cursor: pointer;
  }
  
  .container {
    position: relative;
    z-index: 1;
    margin-top: 250px;
  }
  
  .img1 {
    z-index: 1;
    width: 100%;
    height: 100vh;
    object-fit: cover;
  }
  
  .img2 {
    position: absolute;
    width: 20%;
    height: auto;
    left: 640px;
    top: 25%;
    z-index: 3;
  }
  
  .buttons {
    position: absolute;
    top: 65%;
    left: 42%;
    display: flex;
    flex-direction: column;
    align-items: center;
    z-index: 4;
    margin-top: 250px;
  }

  a {
    text-decoration: none;
    color: #ffffff;
  }
  
  button {
    background-color: transparent;
    color: white;
    border: 100px;
    border-color: black;
    padding: 10px 20px;
    margin: 10px;
    font-size: 16px;
    border-radius: 20px;
    cursor: pointer;
  }
  
  button:nth-of-type(1) {
    top: 70%;
    margin-left: 45%;
    width: 200px;
    margin-bottom: 0px;
  }
  
  button:nth-of-type(2) {
    top: 75%;
    margin-left: 45%;
    width: 100px;
    margin-bottom: 0px;
  }
  
  button:nth-of-type(3) {
    top: 80%;
    margin-left: 45%;
    width: 100px;
  }
  
  .buttons button:hover {
    color: black;
    transform: scale(1.1);
    font-weight: bold;
    /*
    box-shadow: 2px 2px 5px white;
    */
  }

    </style>


</head>
<body>
    <form id="form1" runat="server">

     <div class = "intro">
        <h1 class = "logo-header">
            <span class = "logo">FL</span><span class = "logo">EX</span>
        </h1>
    </div>
<nav>
    <div class="navigation">
      <a href="#" class="logo"></a>
      <div class="navbar">
        <ul>
          <li><a href="Contact.aspx">Contact Us</a></li>
        </ul>
      </div>
    </div>
  </nav>


<div class="container">
<%--<img src="abstfac.jpg" class = "img1">--%>
<img src="flex-logo.png" class="img2">
<div class="buttons">

    
    <a href="LoginAdmin.aspx"><button onclick ="academicCLick">Academic Office</a></button>
    <a href="LoginFaculty.aspx"><button>Faculty</a></button>
    <a href="LoginStudent.aspx"><button>Student</a></button>
</div>
</div>
        
<%--    <script src = "JavaScript.js"></script> --%>

            <script>
                let intro = document.querySelector('.intro');
                let logo = document.querySelector('.logo-header');
                let logoSpan = document.querySelectorAll('.logo');

                window.addEventListener('DOMContentLoaded', () => {

                    setTimeout(() => {

                        logoSpan.forEach((span, idx) => {
                            setTimeout(() => {
                                span.classList.add('active');
                            }, (idx + 1) * 400)
                        })

                        setTimeout(() => {
                            logoSpan.forEach((span, idx) => {

                                setTimeout(() => {
                                    span.classList.remove('active');
                                    span.classList.add('fade');
                                }, (idx + 1) * 50)
                            })
                        }, 2000);

                        setTimeout(() => {
                            intro.style.top = '-100vh';
                        }, 2300)


                    })

                });
            </script>


    </form>
</body>
</html>
