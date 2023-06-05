<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="Question_Paper_Generator.Add_User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <title></title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
    <style>
        body {
        font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
        </style>
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

		.row{

			position:absolute;
			top:50%;
			left:50%;
			padding:30px;
			width:400px;
			height:360px;
			transform:translate(-50%, -50%);
            background:rgba(0,0,0,0.6);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.6);

		}

        .row .add_user #T1,.add_user #T2,.add_user #T3, .add #T4
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 20px;
            color: white;
            font-size: 15px;
            width: 100%;
            margin-bottom:0;
        }

        h1{

            margin-top:0px;
            font-size:45px;
        }

        h1,h2{

            text-align:center

        }

        h2{
            color: rgba(51, 204, 255);
            margin-bottom:30px;
            font-size:30px;
        }
     
        #BtnSub,#BtnReset
		{
			width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
            margin-left:45px;
            margin-top:20px;
			
		}

		#BtnSub:hover
		{
			background-color:#9d65fc;
            cursor: pointer;
            border-color: #9d65fc;
		}
        
        #BtnReset:hover
		{
			background-color:#9d65fc;
            cursor: pointer;
            border-color: #9d65fc;
		}

		#LBback
		{
			color:black;
			text-decoration:none;
            margin:20px 0 0 140px;
			
		}

		#LBback:hover
		{
			color:white;
		}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generater </h1>
            <div class="row">
                <h2> Add User </h2>

                <div class="add_user">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="User ID" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Unique ID" Font-Size="12px" ForeColor="Red" ControlToValidate="T1"></asp:RequiredFieldValidator>
                </div>

                <div class="add_user">
                    <asp:TextBox ID="T2" required="true" runat="server" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter User First Name" Font-Size="12px" ForeColor="Red" ControlToValidate="T2"></asp:RequiredFieldValidator>

                </div>

                <div class="add_user">
                    <asp:TextBox ID="T3" required="true" runat="server" placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter User Last Name" Font-Size="12px" ForeColor="Red" ControlToValidate="T3"></asp:RequiredFieldValidator>

                </div>

                <div class="add">
                    <asp:TextBox ID="T4" required="true" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter User Email ID" Font-Size="12px" ForeColor="Red" ControlToValidate="T4"></asp:RequiredFieldValidator>
                </div>
                     <asp:Button ID="BtnSub" runat="server" Text="Submit" OnClick="BtnSub_Click"/>
                    <input id="BtnReset" type="reset" value="Reset" />
                    <asp:LinkButton ID="LBback" runat="server" href="A_Menu.aspx">Back</asp:LinkButton>      
            </div>
        </div>
     </form>
</body>
</html>
