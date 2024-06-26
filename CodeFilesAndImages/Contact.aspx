<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

    <style>
        *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container {
    position: relative;
    width: 100%;
    height: 100vh;
    background: black;
    display: flex;
    justify-content: center;
    align-items: center;
}

.item {
    width: 100%;
    height: 550px;
    max-width: 820px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 0 20px 10px gray;
    overflow: hidden;
    grid-template-columns: repeat(2, 1fr);
    display: grid;
    z-index: 1000;
}

.contact {
    background: black;
    color: white;
    /*
    top: 50px;
    */
}

.submit-form{
    background: red;
}

.first-text {
    padding-left: 20px;
    padding-top: 20px;
    font-size: 35px;
    color: white;
    font-weight: 500;
    text-transform: capitalize;
}

.image {
    height: 280px;
    width: 300px;
    padding-left: 120px;
    padding-top: 100px;

}

.second-text {
    padding-left: 30px;
    padding-top: 20px;
    margin-top: 20px;
}

.social-media {
    display: flex;
    list-style: none;
}

 ul li {
    padding-left: 30px;
    font-size: 24px;
    margin-top: 30px;
}

 i {
    background: white;
    padding: 5px;
    border-radius: 10px;
    transition: .3s;
}

.social-media i:hover {
    background: gray;
    color: white;
}

.social-media a {
    text-decoration: none;

}

.third-text {
    font-size: 25px;
    position: relative;
    top: 20px;
    left: 20px;
    padding-top: 10px;
    color: black;
}

form {
    padding: 0 50px;
    height: 100%;
    width: 100%;
    overflow: hidden;
}

.input-box {
    height: 40px;
    width: 70%;
    margin: 30px 0 0 10px;
    position: relative;
}

.input {
    width: 100%;
    height: 100%;
    background: transparent;
    border: 2px solid black;
    border-radius: 20px;
    outline: none;
    padding-left: 10px;
    color: black;
    font-size: 16px;
}

.input-box label {
    position: absolute;
    top: 50%;
    left: 10px;
    padding-left: 10px;
    transform: translateY(-50%);
    font-size: 10px;
    font-weight: 500;
    color: black;
    transition: .3s;
}

.input-box .input:focus~label,
.input-box .input:valid~label {
    top: -1px;
    left: 10px;
    background: white;
    font-weight: 500;
    font-size: 12px;
    padding: 5px;
}
textarea.input {
    resize: none;
    min-height: 150px;
    overflow: auto;
    padding-top: 10px;
    font-size: 12px
}

.btn {
    position: relative;
    top: 120px;
    background: black;
    outline: none;
    border: none;
    border-radius: 10px;
    height: 40px;
    width: 30%;
    font-size: 16px;
    color: white;
    cursor: pointer;
    font-weight: 500;
    left: 10px;
}

@media(max-width:850px) {
    .item{
        grid-template-columns: 1fr;
}
    .contact {
        display: none;
    }
    .text {
        font-size: 40px;
        text-align: center;
    }
    .btn{
        width: 25%;
        height: 40px;
        font-size: 12px;
    }
}

@media(max-width:480px) {
    .item{
        grid-template-columns: 1fr;
}
    .contact {
        display: none;
    }
    .text {
        font-size: 20px;
        text-align: center;
    }
    .btn{
        width: 20%;
        height: 40px;
        font-size: 12px;
    }
}
    </style>

</head>
<body>
    <form id="form1" runat="server">

    <div class = "container">
        <div class = "item">
            <div class="contact">
                <div class="first-text">Get in touch!</div>
                <img src="uniLogo.png" class="image">
                <div class="social-links">
                    <div class="second-text">Connect with us:</div>
                    <ul class="social-media">
                        <li><a href="#"><i class='bx bxl-facebook'></i></a></li>
                        <li><a href="#"><i class='bx bxl-twitter'></i></a></li>
                        <li><a href="#"><i class='bx bxl-linkedin'></i></a></li>
                        <li><a href="#"><i class='bx bxl-youtube'></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="submit_form">
                <h4 class="third-text text">Contact Us</h4>
                <form action="">
                    <div class="input-box">
                        <input type="text" class = "input" required>
                        <label for="">Name</label>
                    </div>
                    <div class="input-box">
                        <input type="email" class = "input" required>
                        <label for="">Email</label>
                    </div>
                    <div class="input-box">
                        <input type="tel" class = "input" required>
                        <label for="">Phone</label>
                    </div>
                    <div class="input-box">
                        <textarea name="" class = "input" required id="message" cols="30" rows="10"></textarea>
                        <label for="">Message</label>
                    </div>
                    <input type="submit" class = "btn" value="Submit">
                </form>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
