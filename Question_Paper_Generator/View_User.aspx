<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_User.aspx.cs" Inherits="Question_Paper_Generator.View_User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         *{
            padding: 0;
            margin: 0;
        }

        body
        {
            background-image: url("P1.jpg");
            background-size: cover;
            background-repeat:no-repeat;
            height:100vh;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .row{

            position:absolute;
            top:30%;
            left:50%;
            transform:translate(-50%, -50%);
            padding:40px;
            width:400px;
            height:265px;
            background:rgba(0,0,0,0.6);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.6);
        }

        .row .user #T1, #T2
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 20px;
            color:white;
            font-size:15px;
            width: 100%;
            margin-bottom: 0px;
            margin-top:20px;
        }

        ::placeholder 
        {
            color: rgba(255, 255, 255, 0.5);
        }

        #GridView1{

            position:absolute;
            top:118%;
            left:1%;

        }

        h1,h2{

            text-align:center;
        }

        h1{

            font-size:45px;
            margin-top:0px;
        }

        h2{
            font-size:30px;
            margin-bottom:20px;
        }

        #Show_T, #Reset
        {
            margin-left: 40px;
            width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
       
        }

        #Back{

            position:center;
            margin:0px 0 -20px 130px;
            color:black;
            text-decoration:none;
        }

        #Show_T{

            margin:0 5px 0 20px;
        }

        #Show_T:hover, #Reset:hover
        {

                background-color:#c8b6ff;
                cursor: pointer;
                border-color: #c8b6ff;
                
        }

        #Back:hover {
            color: white;
        }

        #GridView1{

            font-size:15px;
            text-align:center;
            margin-left:-25px;
            padding:50px;
            height: 119px;
            width: 452px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generator </h1>
            <div class="row">
                  <h2> Users Details </h2>
                 <div class="user">
                     <asp:TextBox ID="T1" required="teue" placeholder="First Name" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter User First Name." ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                 </div>
                
                <div class="user">
                     <asp:TextBox ID="T2" required="true" placeholder="Last Name" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter User Last Name." ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="Show_T" runat="server" Text="Show" OnClick="Button1_Click"/>
                <asp:Button ID="Reset" runat="server" Text="Reset" OnClick="Button2_Click"/>
            <br/><br/>
                <asp:LinkButton ID="Back" runat="server" href="A_Menu.aspx">Back</asp:LinkButton>
               
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Fname" HeaderText="First name" SortExpression="Fname" />
                            <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Lname" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:CommandField HeaderText="Operations" ShowEditButton="True" >
                            <ControlStyle BackColor="White" BorderColor="White" ForeColor="#66FF33" />
                            </asp:CommandField>
                            <asp:CommandField ShowDeleteButton="True" >
                            <ControlStyle BackColor="White" ForeColor="Red" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemoConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [users] ([ID], [Fname], [Lname], [Email]) VALUES (@ID, @Fname, @Lname, @Email)" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [Fname] = @Fname, [Lname] = @Lname, [Email] = @Email WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Fname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Lname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Fname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Lname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource> 
            </div>
        </div>
    </form>
</body>
</html>
