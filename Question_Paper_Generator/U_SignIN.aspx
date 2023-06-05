
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U_SignIN.aspx.cs" Inherits="Question_Paper_Generator.U_SignIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <%--<link href="Style1.css" rel="stylesheet"/>--%> 
    <link href="StyleSheet1.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title> User Login </title>
    <style>
        *{
            padding:0;
            margin:0;
        }

        body{
    
            background-image: url("P1.jpg");
            background-size: cover;
            background-repeat:no-repeat;
            height:100vh;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        
        .row
		{
			position:absolute;
			top:50%;
			left:50%;
			padding:30px;
			width:430px;
			height:250px;
			transform:translate(-50%, -50%);
            background:rgba(0,0,0,0.5);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.5);

		}

		h1{

			font-size:45px;
			margin-top:0px;
		}

		h1,h2
		{
			text-align:center;
			margin-bottom:30px;

		}

		h2
		{
				  font-size:30px;
				  margin-top:0px;
				  color: rgba(51, 204, 255);
		}

        .row .reg #T1, .reg #T2
		{
			border:none;
			outline:none;
			border-bottom:1px solid #fff;
			background:transparent;
			height:20px;
			color:white;
			font-size:15px;
			width:100%;
			margin-bottom:0px;
		}

		#BtnSubmit,#BtnReset
		{
			width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
			margin-left:45px;
			margin-top:-10px;
		}

		#BtnSubmit:hover, #BtnReset:hover
		{
			background-color:#9d65fc;
            cursor: pointer;
            border-color: #9d65fc;
		}

        #btnBack
		{
			color:black;
			text-decoration:none;
			margin-left:140px;
            margin-top:0px;

		}

		#btnBack:hover
		{
			color:white;
		}

		::placeholder 
		{
			color: rgba(255, 255, 255, 0.3);
			padding:0px;
			
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

            margin-left:550px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generator </h1>
			<asp:LinkButton ID="admin_icon" runat="server" href="A_SignIN.aspx" class="fa fa-user-circle" aria-hidden="true"> </asp:LinkButton>
        <asp:Label ID="or" runat="server" Text="Or"></asp:Label>
        <asp:LinkButton ID="user_icon" runat="server" href="U_SignIN.aspx" class="fa fa-user" aria-hidden="true"> </asp:LinkButton>
        <br/>
        
        
        <asp:Label ID="admin" runat="server" Text="Admin" href="A_SignIN.aspx"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="user" runat="server" Text="User" href="U_SignIN.aspx"></asp:Label>

        <asp:Label ID="Label1" runat="server" ></asp:Label>
            <div class="row">
                <h2>User Login </h2>
                <div class="reg">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="User ID"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your User Id" ForeColor="Red" ControlToValidate="T1" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="reg">
                    <asp:TextBox ID="T2" required="true" runat="server" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your Email Id" ForeColor="Red" ControlToValidate="T2" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
            <br/>
            <br/>
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click"/>
				<asp:Button ID="BtnReset" runat="server" Text="Reset" />
			<br/><br/>
                <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click">Back</asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>
