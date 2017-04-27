<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ragistration_Form.aspx.cs" Inherits="Question_1.Ragistration_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>

    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnId" runat="server" />
        <div style="height: auto; width: auto">
            <table style="border: thin; border: 3px thin black">
                <caption>Book Details</caption>
                <tr style="height: auto; width: auto">
                    <td style="height: auto; width: 100px">
                        <asp:Label ID="BookNameLabel" runat="server" Text="Book Name"></asp:Label>
                    </td>
                    <td style="height: auto; width: 200px">
                        <asp:TextBox ID="BookNameTextBox" runat="server" Width="200px" ToolTip="Book Name"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: auto; width: auto">
                    <td style="height: auto; width: 100px">
                        <asp:Label ID="AuthorLabel" runat="server" Text="Author"></asp:Label>
                    </td>
                    <td style="height: auto; width: 200px">
                        <asp:TextBox ID="AuthorTextBox" runat="server" Width="200px" ToolTip="Author Name"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: auto; width: auto">
                    <td style="height: auto; width: 100px">
                        <asp:Label ID="PublisherLabel" runat="server" Text="Publisher"></asp:Label>
                    </td>
                    <td style="height: auto; width: 200px">
                        <asp:TextBox ID="PublisherTextBox" runat="server" Width="200px" ToolTip="Publisher Name"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: auto; width: auto">
                    <td style="height: auto; width: 100px">
                        <asp:Label ID="PriceLabel" runat="server" Text="Price"></asp:Label>
                    </td>
                    <td style="height: auto; width: 200px">
                        <asp:TextBox ID="PriceTextBox" runat="server" Width="200px" ToolTip="Price"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: auto; width: auto">
                    <td></td>
                    <td style="height: auto; width: 200px; text-align: center">
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" OnClientClick="return validateall()" />&nbsp;&nbsp;
                        &nbsp;&nbsp;<asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Book Name">
                        <ItemTemplate>
                            <asp:Label ID="BookName_Label" runat="server" Text='<%# Eval("bookname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Author">
                        <ItemTemplate>
                            <asp:Label ID="Author_Label" runat="server" Text='<%# Eval("bookauthor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Publisher">
                        <ItemTemplate>
                            <asp:Label ID="Publisher_Label" runat="server" Text='<%# Eval("bookpublisher") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Price_Label" runat="server" Text='<%# Eval("bookprice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:ImageButton ID="EditImageButton" runat="server"
                                src="Images/Edit_Icon.png" Height="30px" CommandArgument='<%# Eval("bookid") %>' CommandName="edit" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:ImageButton ID="DeleteImageButton" runat="server"
                                src="Images/Delete_Icon.png" Height="30px" CommandArgument='<%# Eval("bookid") %>' CommandName="deleterow" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
    </form>
    <script>
        function validatetextbox(param) {
            var isValid = true;
            var textbox = document.getElementById(param);
            if (textbox.value =="") {
                isValid = false;
                alert(textbox.title + " can not be Empty...");
            }
            return isValid
        }

        function validateall() {
            var isValid = true;
            if (isValid)
                isValid = validatetextbox("BookNameTextBox");
            if (isValid)
                isValid = validatetextbox("AuthorTextBox");
            if (isValid)
                isValid = validatetextbox("");
            if (isValid)
                isValid = validatetextbox("");
            return isValid;
        }
    </script>
</body>
</html>
