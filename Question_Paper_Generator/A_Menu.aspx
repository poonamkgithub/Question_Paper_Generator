<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Menu.aspx.cs" Inherits="Question_Paper_Generator.A_Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title> Admin Menu </title>

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

        .row #L1,#L2,#L3,#L4,#L5,#L6,#L7
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
        .row{

            width:400px;
            height:420px;
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
    <form id="form2" runat="server">
        <div class="container">
            <h1> Question Paper Generator</h1>
            <div class="row">
                <h2> Menu Page</h2>
                        <asp:LinkButton ID="L1" runat="server" href="Add_User.aspx"> Add User </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L2" runat="server" href="View_User.aspx"> View Users </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L3" runat="server" href="Add_Question.aspx"> Add Questions </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L4" runat="server" href="Create_QP.aspx"> Create Question Paper </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L5" runat="server" href="View_Q.aspx"> View Questions </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L6" runat="server" href="View_QP"> View Question Papers </asp:LinkButton>
                    <br/><br/>
                        <asp:LinkButton ID="L7" runat="server" OnClick="L7_Click" OnClientClick="Confirm()" > LogOut </asp:LinkButton>
                    <br/><br/>
                
            </div>
            
        </div>
    </form>
</body>
</html>
