<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U_Menu.aspx.cs" Inherits="Question_Paper_Generator.U_Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> User Menu </title>
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure? you want to logout?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
    <style>
       
        body
        {
            padding:0;
            margin:0;
            background-image:url(P1.jpg);
            background-size:cover;
            background-repeat:no-repeat;
            height:100vh;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            text-align:center;
        }

        .row #L4,#L5,#L6, #L7, #L8
        {

            text-decoration:none;
            color:Black;
            font-size:21px;
            color:white;
            text-align:center;

        }

        h2{

            text-align:center;
            margin-bottom:40px;
            color: rgba(51, 204, 255);
            margin-top:0px;
            font-size:30px;
        }

        h1{

            text-align:center;
            margin-top:0px;
            font-size:45px;
        }
        .row
        {

            width:400px;
            height:300px;
            position:absolute;
            left:50%;
            top:50%;
            transform: translate(-50%, -50%);
            padding:30px;
            box-sizing:border-box;
            background: rgba(0,0,0,0.5);
            color:white;
            box-shadow: 0 15px 100px rgba(0,0,0,0.5);   
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generator</h1>
            <div class="row">
                <h2> User Menu </h2>
                        <asp:LinkButton ID="L5" runat="server" href="Add_Question.aspx"> Add Questions</asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L6" runat="server" href="View_Q"> View Questions</asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L7" runat="server" href="View_QP"> View Question Papers </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L8" runat="server" OnClick="L6_Click" OnClientClick="Confirm()"> LogOut </asp:LinkButton>
                    <br/><br/>
            </div>
        </div>
    </form>
</body>
</html>
