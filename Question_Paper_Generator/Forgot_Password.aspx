<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="Question_Paper_Generator.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title> Forgot Password </title>
    <style>

        body{

            padding:0;
            margin:0;
            background-image:url(P1.jpg);
            background-size:cover;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            background-repeat:no-repeat;
            height:100vh;
            
        }

        h2{

            text-align:center;
            color: rgba(51, 204, 255);
            margin-bottom:40px;
            margin-top:0px;
        }

        h1{

            text-align:center;
            margin-top:0px;
            font-size:45px;
        }
        
        .row{

            position:absolute;
            left:50%;
            top:50%;
            transform:translate(-50%, -65%);
            width:400px;
            height:270px;
            padding:30px;
            background:rgba(0,0,0,0.6);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.6);
        }

        .row .email #T1, #T2, #T3
        {
           
        }

        .row #T1, #T2, #T3
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 20px;
            color: #fff;
            font-size: 15px;
             width: 100%;
            margin-bottom: 0px;
        }

        .row i
        {

            position:absolute;
            font-size:20px;
            color:gray;
            margin:15px 0 0 -45px;
        }

        i.fa-envelope 
        {
            margin-top: -30px;
            margin-left: 316px;
            cursor: pointer;
        }

        ::placeholder 
        {
            color: rgba(255, 255, 255, 0.5);
        }

        #B1, #B2{

            width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
        }

        #B1{

            margin:0 10px 0 60px;
        }

        #B1:hover, #B2:hover{

            background-color: #9d65fc;
            cursor:pointer;
            border-color: #9d65fc;
        }

        #L1{

            text-decoration:none;
            color:black;
            margin-left:150px;
        }
        #L1:hover{

            color:white;
        }

        #DisplayMessage{

            margin-left:780px;
            margin-bottom:900px;
            margin-top:500px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1> Question Paper Generator </h1>
        <div class="conatiner">
            <asp:Label ID="DisplayMessage" runat="server"></asp:Label>  
            <div class="row">
                <h2> Account Recovery </h2>
                <div class="email">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Plaese enter your email ID!!" ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                 </div>
            <br/>
                <div class="email">
                    <asp:TextBox ID="T2"  required="true" runat="server" placeholder="ID"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Plaese enter Your ID" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <%--<div class="email" >
                    <asp:TextBox ID="T3" runat="server" placeholder="Confirm-Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Plaese enter Your Confirm-Password" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                  	<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Must be Same!!" ForeColor="red" ControlToValidate="T3" ControlToCompare="T2"  Font-Size="12px"></asp:CompareValidator>
           <br/>  
          
                    <input id="Checkbox1" type="checkbox" onclick="showPassword(this)"/>Show Password
                </div>
            <br/>--%> 
                <%--<asp:Label ID="L2_Result" runat="server" ></asp:Label>--%>
            <div class="email">

                <asp:Button ID="B1" runat="server" Text="Submit" OnClick="B1_Click"/>
                <asp:Button ID="B2" runat="server" Text="Reset" />
            <br/><br/>
                <asp:LinkButton ID="L1" runat="server">Back</asp:LinkButton>
            </div>
            </div>
        </div>
    </form>   
</body>
</html>

