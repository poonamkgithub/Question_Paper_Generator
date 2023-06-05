<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_SignUp.aspx.cs" Inherits="Question_Paper_Generator.A_SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Admin Register </title>
	<style>
		body
		{
			padding:0;
			margin:0;
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
			height:500px;
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

		.row .S_QP #T1, .S_QP #T2, .S_QP #T3, .S_QP #T4, .S_QP #T5
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
		
		#L1{
			margin-left:70px;
		}

		#LB1
		{
			font-size:15px;
			text-decoration:none;
			color: #9d65fc;
		}

		.LB2
		{
			
		}

		.V_pass
		{
			font-size:12px;
		}

		#btnSubmit,#btnReset
		{
			width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
			margin-left:45px;
			margin-top:-10px;
		}

		#btnSubmit:hover, #btnReset:hover
		{
			background-color:#9d65fc;
            cursor: pointer;
            border-color: #9d65fc;
		}

		#btnBack
		{
			color:black;
			text-decoration:none;
			margin-left:150px;
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
	</style>

	<script>
		function showPassword(Checkbox1)
		{
			var PasswordTextBox = document.getElementById('T3');
			var CPasswordTextBox = document.getElementById('T4');

			if (Checkbox1.checked == true)
			{
				PasswordTextBox.setAttribute("type", "text");
				CPasswordTextBox.setAttribute("type", "text");
			}
			else
			{
                PasswordTextBox.setAttribute("type", "password");
                CPasswordTextBox.setAttribute("type", "password");
			}
		}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
			<h1> Question Paper Generater </h1>
			<asp:Label ID="Lle1" runat="server"></asp:Label>
			<div class="row">
				<h2> Sign Up </h2>
				<div class="S_QP">
					<asp:TextBox ID="T5" required="true" runat="server" placeholder="ID"></asp:TextBox> 
					<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Plaese enter Unique Id" ControlToValidate="T5" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="T5" ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)" ErrorMessage="Please enter only Numbers" ForeColor="Red" Font-Size="12px"></asp:RegularExpressionValidator>
				</div>
			<br/>
				<div class="S_QP">
					<asp:TextBox ID="T1" required="true" runat="server" placeholder="Full Name"></asp:TextBox> 
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Plaese enter Your FullName" ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
				</div>
			<br/>
				<div class="S_QP">
					<asp:TextBox ID="T2" required="true" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Plaese enter Your email ID" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
				</div>
			<br/>
				<div class="S_QP">
					<asp:TextBox ID="T3" required="true" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Plaese enter Password" ControlToValidate="T3" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
				</div>
			<br/>
				<div class="S_QP">
					<asp:TextBox ID="T4" required="true" runat="server" placeholder="Confirm-Password" TextMode="Password" ></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Plaese enter Your C-Password" ControlToValidate="T4" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
				<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Must be Same!!" ForeColor="red" ControlToValidate="T4" ControlToCompare="T3"  Font-Size="12px"></asp:CompareValidator>
			<br/>	
					<input id="Checkbox1" type="checkbox" onclick="showPassword(this)"/>Show Password
			<br/>
				</div>
			<br/>
				<div>
					<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
					<asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"/>
			<br/><br/>
					<asp:Label ID="L1" runat="server">Have an account?</asp:Label>
					<asp:LinkButton ID="LB1" runat="server" href="A_SignIN.aspx">Sign In</asp:LinkButton>
					<br/><br/>
					<asp:LinkButton ID="btnBack" runat="server" href="A_SignIN.aspx"> Back </asp:LinkButton>
				</div>
			</div>
		</div>
    </form>
</body>
</html>
