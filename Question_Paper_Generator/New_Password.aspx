<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New_Password.aspx.cs" Inherits="Question_Paper_Generator.New_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> New Password </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        body{

             padding: 0;
             margin: 0;
             background-image: url("P1.jpg");
             background-size:cover;
             background-repeat:no-repeat;
             height:100vh;
             /*width:100%;*/
             font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .row{
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%, -50%);
            padding:30px;
            box-sizing:border-box;
            background: rgba(0,0,0,0.5);
            color:white;
            box-shadow: 0 15px 100px rgba(0,0,0,0.5);
            width:450px;
            height:310px;
        }

        h1,h2{

            text-align:center;
        }

        h1{

            font-size:45px;
            margin-top:0px;
        }

        h2{
            margin-top:0px;
            color: rgba(51, 204, 255);
        }

        .row .pass #T1, #T2, #T3
        {
            width: 100%;
            margin-bottom: 0px;
        }

        .row #T1, #T2, #T3[type = "text"], .row #T1, #T2[type = "Password"] 
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 30px;
            color: #fff;
            font-size: 15px;
        }
        
        .row #T3
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 30px;
            color: #fff;
            font-size: 15px;
        }

        ::placeholder 
        {
            color: rgba(255, 255, 255, 0.5);
            padding:0px;
        }

        #CheckBox1{

            font-size:10px;
            margin-bottom:-50px;
        }

        #LBback{

            text-decoration:none;
            color:black;
            margin-left:150px;
            margin-top:-50px;
        }

        #LBback:hover{

            color:white;
        }

        #btng{

            width: 170px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
            margin-left:40px;
            cursor:pointer;
			
        }
        
        #btnReset{

            width: 60px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
			margin-left:20px;
            cursor:pointer;
			
        }

        #submit:hover
        {
            background-color:#9d65fc;
            cursor: pointer;
            border-color: #c8b6ff;
        }
        
        #reset:hover 
        {
            background-color:#9d65fc;
            cursor: pointer;
            border-color: #c8b6ff;
        }


    </style>


    <script>
		function showPassword(Checkbox1)
		{
			var PasswordTextBox = document.getElementById('T1');
			var CPasswordTextBox = document.getElementById('T2');

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
            <h1> Question Paper Generator </h1>
            <asp:Label ID="L1" runat="server" ></asp:Label>
            <div class="row">
                <h2> New Password </h2> 
           <br/>
               <%-- <div class="pass">
                    <asp:TextBox ID="T3" required="true" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Plaese enter your email ID!!" ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>--%>
          
                <div class="pass">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="New Password" ></asp:TextBox> 
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Plaese enter Your Password" ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>

                <div class="pass">
                    <asp:TextBox ID="T2" required="true" runat="server" placeholder="Confirm-Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" runat="server" ErrorMessage="Plaese enter Your Confirm-Password" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                  	<asp:CompareValidator ID="CompareValidator1"  runat="server" ErrorMessage="Password Must be Same!!" ForeColor="red" ControlToValidate="T2" ControlToCompare="T1"  Font-Size="12px"></asp:CompareValidator>
           <br/>  
                    <input id="Checkbox1" type="checkbox" onclick="showPassword(this)"/>Show Password
                </div>

           <br/><br/>

                <div class="pass">
                    <asp:Button ID="btng" runat="server" Text="Generate New Password" OnClick="btng_Click"/>
                    <%--<asp:Button ID="check" runat="server" Text="Check" OnClick="check_Click"/>--%>
                    <input id="btnReset" type="reset" value="Reset" />
           <br/><br/> 
                    <asp:LinkButton ID="LBback" runat="server">Back</asp:LinkButton>
                </div>  
            </div>
        </div>
    </form> 
</body>
</html>
