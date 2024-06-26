<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginAdmin.aspx.cs" Inherits="LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

     <style>
        *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    /*
    background-image: image("backgorund.jpg");
    */
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url("abAdmin.jpg") no-repeat;
    background-size: cover;
    background-position: center;
}

         header{
    position: absolute;
    top: 0;
    right: 0;
    width: 100%;
    padding: 20px;
    background: black;
    opacity: 40%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 50;
}

         .container a {
    position: relative;
    font-size: 14px;
    color: white;
    text-decoration: none;
    font-weight: 500;
    margin-left: 1550px;
    margin-right: 0px;
}
         .wrapper {
    position: relative;
    width: 400px;
    height: 440px;
    background: transparent;
    border: 2px solid white;
    -webkit-backdrop-filter: blur(20px);
    border-radius: 20px;
    box-shadow: 0 0 30px black;
    display: flex;
    justify-content: center;
    align-items: center;
}

         .wrapper .form-box{
    
    width: 100%;
    padding: 40px;
    z-index: 45;
}
         .form-box h2 {
    font-size: 2em;
    color: white;
    text-align: center;
    margin-top: 60px;
    margin-bottom: 30px;
}

         .input-box{
    position: relative;
    width: 100%;
    height: 50px;
    border-bottom: 2px solid white;
             top: 0px;
             left: 0px;
             margin-left: 0;
             margin-right: 0;
             margin-bottom: 35px;
         }

.input_box label1 {
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    font-size: 1em;
    color: white;
    font-weight: 500;
    pointer-events: none;
    transition: 0.5s;
}

.input_box label2 {
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    font-size: 1em;
    color: white;
    font-weight: 500;
    pointer-events: none;
    transition: 0.5s;
}

#Label1, #Label2 {
    color: white;
    margin-top: 20px;
}

.input-box input[type="text"],
.input-box input[type="password"] {
    width: 100%;
    height: 100%;
    background: transparent;
    border: none;
    outline: none;
    font-size: 0.9em;
    color: white;
    font-weight: 400;
    padding: 0 35px 0 5px;

}

.input-box input:focus~label1,
.input-box input:valid~label1 {
    top: -5px;
}

.remember-forgot {
    font-size: .8em;
    color: black;
    font-weight: 500;
    margin: -15px 0 15px;
    display: flex;
    justify-content: space-between;
}

.remember-forgot label input {
    accent-color: black;
    margin-right: 3px;
}

.remember-forgot a {
    color: white;
    text-decoration: none;
}

.remember-forgot a:hover {
    text-decoration: underline;
}

.btn {
    width: 100%;
    height: 45px; 
    background: #143a5a;
    border: none;
    outline: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1em;
    color: white;
    font-weight: 500;
    margin-top: 15px;
}

         </style>
</head>
<body>
    <form id="form1" runat="server">

         <header>
        <nav class = "container">
            <a href="Contact.aspx">Contact Us</a>
        </nav>
    </header>


         <div class="wrapper">
             <div class="form-box login">
                 <h2>Login</h2>
             <div class ="input-box">
               <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
               <asp:TextBox ID="txtUsername" runat="server" Required="True"></asp:TextBox>
            </div>

         <div class ="input-box">
               <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
               <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Required="True"></asp:TextBox>
            </div>

                   <div class="remember-forgot">
                        <label> <input type="checkbox">Remember me</label>
                        <a href="#">Forgot Password</a>
                    </div>
                    <asp:Button ID="subbtn" class="btn" runat="server" Text="Login" OnClick="Login_btn" CssClass="btn btn-primary btn-primary-blink" />
        </div>
        </div>


    </form>
</body>
</html>
