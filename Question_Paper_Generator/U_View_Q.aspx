<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="U_View_Q.aspx.cs" Inherits="Question_Paper_Generator.U_View_Q" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> View Questions Paper </title>
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
            /*height:100vh;*/
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .row{

            position:absolute;
            top:35%;
            left:50%;
            transform:translate(-50%, -50%);
            padding:40px;
            width:370px;
            height:340px;
            background:rgba(0,0,0,0.6);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.6);
        }

        .row .view_Q #T1, #T2, #T3
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 20px;
            color:white;
            font-size: 15px;
            width: 100%;
            margin-bottom: 0px;
        }

        ::placeholder 
        {
            color: rgba(255, 255, 255, 0.5);
        }

        h1,h2{

            text-align:center;
        }

        h1{

            margin-top:0px;
            font-size:45px;
        }
        h2{
            font-size:30px;
            margin:0px 0 40px 0;
            color: rgba(51, 204, 255)
            
        }

        #Show_T, #Reset
        {
            margin-left: 30px;
            width: 100px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
       
        }

        #Back{

            position:center;
            margin:0 0 -20px 120px;
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

            margin-left:410px;
            margin-top:450px;
        }

        CommandField{

            color:green;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generater </h1>
            <div class="row">
                <h2> View Questions </h2>
                <div class="view_Q">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="Course Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Course Name" ControlToValidate="T1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="view_Q">
                    <asp:TextBox ID="T2" required="true" runat="server" placeholder="Subject"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Subject Name" ControlToValidate="T2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="view_Q">
                    <asp:TextBox ID="T3"  required="true" runat="server" placeholder="Semester"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Semester" ControlToValidate="T3" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
          <br/>
                <asp:Button ID="Show_T" runat="server" Text="Show Table" OnClick="Show_T_Click"/>
                <input id="Reset" type="reset" value="Reset" />
                <br/>
                <br/>
                <asp:LinkButton ID="Back" runat="server" href="U_Menu.aspx"> Back </asp:LinkButton>
           </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Height="61px" Width="938px" CellSpacing="2" DataKeyNames="QID" OnRowEditing="GridView1_RowEditing">
                <Columns>
                <asp:BoundField DataField="QID" HeaderText="QID" SortExpression="QID" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question">
                </asp:BoundField>
                <asp:BoundField DataField="lod" HeaderText="difficulty level" SortExpression="lod"></asp:BoundField>
                <asp:BoundField DataField="unit" HeaderText="unit" SortExpression="unit"></asp:BoundField>
                <asp:BoundField DataField="sem" HeaderText="semester" SortExpression="sem"></asp:BoundField>
                <asp:BoundField DataField="sub" HeaderText="subject" SortExpression="sub"></asp:BoundField>
                <asp:BoundField DataField="course" HeaderText="course" SortExpression="course"></asp:BoundField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" HeaderText="Operations"></asp:CommandField>
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
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemoConnectionString %>" SelectCommand="SELECT * FROM [Add_Question]" DeleteCommand="DELETE FROM [Add_Question] WHERE [QID] = @QID" InsertCommand="INSERT INTO [Add_Question] ([QID], [Question], [lod], [unit], [sem], [sub], [course]) VALUES (@QID, @Question, @lod, @unit, @sem, @sub, @course)" UpdateCommand="UPDATE [Add_Question] SET [Question] = @Question, [lod] = @lod, [unit] = @unit, [sem] = @sem, [sub] = @sub, [course] = @course WHERE [QID] = @QID">
            <DeleteParameters>
                <asp:Parameter Name="QID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="QID" Type="Int32" />
                <asp:Parameter Name="Question" Type="String" />
                <asp:Parameter Name="lod" Type="String" />
                <asp:Parameter Name="unit" Type="String" />
                <asp:Parameter Name="sem" Type="String" />
                <asp:Parameter Name="sub" Type="String" />
                <asp:Parameter Name="course" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Question" Type="String" />
                <asp:Parameter Name="lod" Type="String" />
                <asp:Parameter Name="unit" Type="String" />
                <asp:Parameter Name="sem" Type="String" />
                <asp:Parameter Name="sub" Type="String" />
                <asp:Parameter Name="course" Type="String" />
                <asp:Parameter Name="QID" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>
        <br/>
        <br/>
        </div>
        </form>
</body>
</html>
