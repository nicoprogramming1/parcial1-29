<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="GestionIngredientes.aspx.cs" Inherits="parcial1_9.GestionIngredientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Descripción: "></asp:Label>
    <asp:TextBox ID="TextBoxDescripcion" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDescripcion" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Add" />
    <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update" />
    <asp:Label ID="LabelResult" runat="server"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridViewIngredientes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSourceIngredientesCRUD" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewIngredientes_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceIngredientesCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" DeleteCommand="DELETE FROM [Ingredientes] WHERE [id] = @id" InsertCommand="INSERT INTO [Ingredientes] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Ingredientes]" UpdateCommand="UPDATE [Ingredientes] SET [descripcion] = @descripcion WHERE [id] = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridViewIngredientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBoxDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="GridViewIngredientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
