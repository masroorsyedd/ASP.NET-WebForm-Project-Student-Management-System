<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="WebFormCRUD_StudentInformation.StudentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified" style="height: 261px">
    <tr>
        <td colspan="2">
            <asp:Label ID="lblTitle" runat="server" Text="Student Information"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">
            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" Width="168px"></asp:TextBox>
        </td>
        <td colspan="2" rowspan="10">
            <asp:GridView ID="dgViewStudents" runat="server" Height="162px" Width="344px" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StudentId" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="StudentId" HeaderText="StudentId" InsertVisible="False" ReadOnly="True" SortExpression="StudentId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Birthdate" HeaderText="Birthdate" SortExpression="Birthdate" DataFormatString="{0:MM/dd/yyyy}" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT * FROM [students]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" Width="166px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">
            <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem>Choose Any</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">
            <asp:Label ID="lblDOB" runat="server" Text="Date of Birth"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDOB" runat="server" Width="168px" OnTextChanged="txtDOB_TextChanged" TextMode="Date"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>
            <asp:CheckBox ID="chkBoxAgree" runat="server" Text="Yes, I Agree!" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">
            <asp:Label ID="lblSID" runat="server" Visible="False"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="185px" OnClick="btnCancel_Click" />
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 236px">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
<br /> <br />
</asp:Content>
