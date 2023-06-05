<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Question.aspx.cs" Inherits="Question_Paper_Generator.Add_Question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title> Add Questions </title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   
    <script>
        function AlertMe()
        {
            Swal.fire(
                {
                  position: 'center',
                  icon: 'success',
                  title: 'Question is Successfully Added!!:)',
                  showConfirmButton: false,
                  timer: 2000
                })
        }
    </script>
    <style>
        body 
        {
             font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
        }
        </style>
    <style>

        body
        {
            padding: 0;
            margin: 0;
            background-image: url("P1.jpg");
            background-size: cover;
            background-repeat:no-repeat;
            height:100vh;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        h1,h2
        {
            text-align:center;
        }

        h1
        {
            font-size:45px;
            margin-top:0;
        }

        h2
        {
            margin-top:-5px;
            color: rgba(51, 204, 255);
            font-size:30px;
        }

        .row
        {
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%, -50%);
            width:500px;
            height:575px;
            padding:30px;
            background:rgba(0,0,0,0.6);
            color:white;
            box-sizing:border-box;
            box-shadow:0 15px 100px rgba(0,0,0,0.6);

        }

        .row .add_Q #T1, #T2, #T3, #T4, #DDL1, #DDL2, #DDL3[type="text"]
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

        .row .add_Quetion #DDL3
        {
            border:none;
            outline:none;
            border-bottom:1px solid #FFF;
            background:transparent;
            height:20px;
            color:grey;
            font-size:15px;
            width:100%;
            margin-bottom:0px;
        }

        .row .add_Quetion #DDL3[type="list"]
        {
            color:grey;
        }

        .row .add_Q #DDL1, #DDL2, #DDL3[type="list"]
        {
            color:grey;
        }

        #DDL1, #DDL2, #DDL
        {
            color:grey;
        }

        ::placeholder 
        {
            color: grey;
        }

        #btnSubmit, #btnReset, #btnShow
        {
            width: 100px;
            margin-top:-30px;
            height: 30px;
            background-color: rgba(51, 204, 255);
            border-color: rgba(51, 204, 255);
            outline-color: #9d65fc;
        }

        #btnReset:hover, #btnSubmit:hover, #btnShow:hover
        {
            background-color:#9d65fc;
            cursor: pointer;
            border-color: #c8b6ff;
        }

        #LBback
        {
            text-decoration:none;
            color:black;
            margin-left:200px;
        }

        #LBback:hover
        {
            color:white;
            
        }

        #btnReset, #btnShow, #btnSubmit
        {
            margin-left:30px;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1> Question Paper Generator </h1>
            <asp:Label ID="MessageDisplay" runat="server" ></asp:Label>
            <div class="row">
                <h2> Add Questions </h2><br/>
                <div class="add_Q">
                    <asp:TextBox ID="T1" required="true" runat="server" placeholder="Question ID" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Question id" ForeColor="Red" ControlToValidate="T1" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="add_Q">
                    <asp:TextBox ID="T2" required="true" runat="server" placeholder="Question" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter Question" ForeColor="Red" ControlToValidate="T2" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="add_Q">
                    <asp:DropDownList ID="DDL1" runat="server">
                        <asp:ListItem Value="-1"> Level of Difficulty </asp:ListItem>
                        <asp:ListItem Value="Easy"> EASY </asp:ListItem>
                        <asp:ListItem Value="Medium"> MEDIUM </asp:ListItem>
                        <asp:ListItem Value="Hard"> HARD </asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID ="RequiredFieldValidator5" runat="server" ErrorMessage="Please select anyone" ControlToValidate="DDL1" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
               <div class="add_Q">
                   
                   <asp:DropDownList ID="DDL2" runat="server">
                       <asp:ListItem Value="-1"> Units </asp:ListItem>
                        <asp:ListItem Value="1">Unit 1 </asp:ListItem>
                        <asp:ListItem Value="2">Unit 2 </asp:ListItem>
                        <asp:ListItem Value="3">Unit 3 </asp:ListItem>
                        <asp:ListItem Value="4">Unit 4 </asp:ListItem>
                        <asp:ListItem Value="5">Unit 5 </asp:ListItem>
                   </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID ="RequiredFieldValidator6" runat="server" ErrorMessage="Please select anyone" ControlToValidate="DDL2" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>
            <br/>
                <div class="add_Quetion">
                    <asp:DropDownList ID="DDL3" runat="server">
                        <asp:ListItem Value="-1"> Semesters </asp:ListItem>
                        <asp:ListItem Value="1">Semester 1 </asp:ListItem>
                        <asp:ListItem Value="2">Semester 2 </asp:ListItem>
                        <asp:ListItem Value="3">Semester 3 </asp:ListItem>
                        <asp:ListItem Value="4">Semester 4 </asp:ListItem>
                        <asp:ListItem Value="5">Semester 5 </asp:ListItem>
                        <asp:ListItem Value="6">Semester 6 </asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator InitialValue="-1" ID ="RequiredFieldValidator7" runat="server" ErrorMessage="Please select anyone" ControlToValidate="DDL3" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>

            <br/>

                <div class="add_Q">
                    <asp:TextBox ID="T3" required="true" runat="server" placeholder="Subject"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter subject name" ControlToValidate="T3" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>  
                </div>

            <br/>

                <div class="add_Q">
                    <asp:TextBox ID="T4" required="true" runat="server" placeholder="Course"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Course Name" ControlToValidate="T3" ForeColor="Red" Font-Size="12px"></asp:RequiredFieldValidator>
                </div>

            <br/>

                <div class="add_Q">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click1"/>

                    <input id="btnReset" type="reset" value="Reset"/>
                <br/><br/>
                    <asp:LinkButton ID="LBback" runat="server" href="A_Menu.aspx" OnClick="LBback_Click">Back</asp:LinkButton>
                </div>  
                <asp:GridView ID="GridView1" Visible="false" runat="server" DataSourceID="SqlDataSource3" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"></asp:CommandField>
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:DemoConnectionString %>" DeleteCommand="DELETE FROM [Add_Question] WHERE [QID] = @QID" InsertCommand="INSERT INTO [Add_Question] ([QID], [Question], [lod], [unit], [sem], [sub], [course]) VALUES (@QID, @Question, @lod, @unit, @sem, @sub, @course)" SelectCommand="SELECT * FROM [Add_Question]" UpdateCommand="UPDATE [Add_Question] SET [Question] = @Question, [lod] = @lod, [unit] = @unit, [sem] = @sem, [sub] = @sub, [course] = @course WHERE [QID] = @QID">
                    <DeleteParameters>
                        <asp:Parameter Name="QID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Question" Type="String"></asp:Parameter>
                        <asp:Parameter Name="lod" Type="String"></asp:Parameter>
                        <asp:Parameter Name="unit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sem" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sub" Type="String"></asp:Parameter>
                        <asp:Parameter Name="course" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Question" Type="String"></asp:Parameter>
                        <asp:Parameter Name="lod" Type="String"></asp:Parameter>
                        <asp:Parameter Name="unit" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sem" Type="String"></asp:Parameter>
                        <asp:Parameter Name="sub" Type="String"></asp:Parameter>
                        <asp:Parameter Name="course" Type="String"></asp:Parameter>
                        <asp:Parameter Name="QID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
