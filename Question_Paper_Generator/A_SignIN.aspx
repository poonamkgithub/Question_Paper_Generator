<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_SignIN.aspx.cs" Inherits="Question_Paper_Generator.A_SignIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <%--<link href="Style1.css" rel="stylesheet"/>--%> 
    <link href="StyleSheet1.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title> Login Page </title>
            <%--<script type="text/javascript">
                $(document).ready(function ()
                {
                    function disableBack()
                    {
                        window.history.forward()
                    }
                    window.onload = disableBack();
                    window.onpageshow = function (evt)
                    {
                        if (evt.persisted) disableBack()
                    }
                });
            </script>--%>

       <%-- <script type="text/javascript">
            window.history.forward();
            function noBack() { window.history.forward(); }
        </script>--%>
        <style>
        * {
            padding: 0;
            margin: 0;
        }
        body
        {
            background-image: url("P1.jpg");
            background-size: cover;
            background-repeat:no-repeat;
            height:100vh;
           /* width:100%;*/
           
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        h1
        {

            text-align:center;
            font-size:45px;
    
        }
        h2 {
            color: rgba(51, 204, 255);
            margin: 0 0 3px;
            margin-bottom:25px;
            text-align: center;
        }

        .loginbox 
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 390px;
            height: 420px;
            padding: 20px;
            box-sizing: border-box;
            background: rgba(0,0,0,0.6);
            color: white;
            box-shadow: 0 15px 100px rgba(0,0,0,0.6);
        }



            .loginbox .userbox #T1, #T2, #T3, #T4[type = "text"] 
            {
                border: none;
                outline: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                height: 20px;
                color: white;
                font-size: 15px;
                width: 100%;
                margin-bottom: 0px;
            }
            
            .loginbox .userbox #DDL1[type = "list"] 
            {
                border: none;
                outline: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                height: 20px;
                color: white;
                font-size: 15px;
                width: 100%;
                margin-bottom: 0px;
            }

        ::placeholder 
        {
            color: rgba(255, 255, 255, 0.3);
            padding:0px;
        }

        #LB
        {

            text-decoration:none;
        }

        #submit
        {
            margin-left: 30px;
            width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
        }

        #reset
        {
            margin-left: 30px;
            width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
        }

        #L5
        {

            margin-left:52px;
        }

        #submit
        {

            margin-left:55px;
        }

        #submit:hover, #reset:hover 
        {
                /*border-color: rgba(51, 204, 255);*/
                background-color: #9d65fc;
                cursor: pointer;
                border-color: #9d65fc;
        }

        #LB1, #LB2 {
 
            text-decoration: none;
            text-decoration-color: white;
            margin-top: -30px;
            color: #9d65fc;
        }

        .color
        {

            width:100px;
            cursor:pointer;
        }

        #LB2
        {

            cursor:pointer;
            margin-top:30px;
            font-size:15px;

        }

        .size
        {
            margin-left:365px;
            margin-bottom:30px;
        }



        .userbox i
        {

            position:absolute;
            font-size:20px;
            color:gray;
            margin:15px 0 0 -45px;
        }

        i.fa-eye ,i.fa-envelope
        {
            margin-top: -49px;
            margin-left: 350px;
            cursor: pointer;
        }

        .container
        {
            border:2px solid black;
        }

        .row
        {
            border:2px solid red;
        }

        .col-md-8, .col-md-4
        {
            border:2px solid blue;
        }

        CheckBox 
        {
            text-decoration-color: gray;
            font-size: 50px;
        }

        LinkButton
        {
            margin-top:50px;
        }

        #LinkButton1 
        {
            text-decoration: none;
            margin: -30px 0 0 360px;
            color: gray;
        }

        #LinkButton2 
        {
            text-decoration: none;
            margin: 0px 0 -110px 360px;
            color:gray;
        }

        #LinkButton1::after, #LinkButton2::after
        {
            color:white;
        }

        #user_icon, #user_icon1{

            margin:20px;
            font-size:60px;
            text-decoration:none;
            color:black;
            
        }
        
        #admin_icon{

            margin:20px;
            font-size:60px;
            text-decoration:none;
            color:black;
            
        }

        #user, #admin{

            font-size:20px;
            cursor:pointer;
        }

        #admin, #admin_icon{

            margin-left:750px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1> Question Paper Generator </h1>
        <asp:LinkButton ID="admin_icon" runat="server" href="A_SignIN.aspx" class="fa fa-user-circle" aria-hidden="true"> </asp:LinkButton>
        <asp:Label ID="or" runat="server" Text="Or"></asp:Label>
        <asp:LinkButton ID="user_icon" runat="server" href="U_SignIN.aspx" class="fa fa-user" aria-hidden="true"> </asp:LinkButton>
        <br/>
        
        
        <asp:Label ID="admin" runat="server" Text="Admin" href="A_SignIN.aspx"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="user" runat="server" Text="User" href="U_SignIN.aspx"></asp:Label>

        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <div class="loginbox">
            <h2> Sign In</h2>
            <br/>

                <div class="userbox">
                    <asp:TextBox ID="T1" required="true" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Your email ID" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
            <br/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="T1" ForeColor="Red" Font-Size="12px" ></asp:RegularExpressionValidator>
                </div>
            <br/>
                <div class="userbox">
                    <asp:TextBox ID="T2" required="true" runat="server" TextMode="Password" placeholder="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your password!!" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
           <br/>
                    <input id="Checkbox" type="checkbox" onchange="document.getElementById('T2').type = this.checked ? 'text' : 'password'"/>Show Password
                </div>
           <br/> 
                <div class="userbox">
                    <asp:LinkButton ID="LB1" runat="server" Text="Forgot Password?" href="Forgot_Password.aspx"/>
                </div>
            <br/>
                <div class="userbox">
                    <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click"/>
                    <asp:Button ID="reset" runat="server" Text="Reset" OnClick="reset_Click"/>
                </div>
            <br/>
                <div class="userbox">
                    <asp:Label ID="L5" runat="server" Text="Don't have an account?"></asp:Label>
                    <asp:LinkButton ID="LB2" runat="server" Text="Sign Up" href="A_SignUp.aspx"/>
                </div>
           
        </div>
    </form>
</body>
</html>
