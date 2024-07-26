<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="GestionRecetasIngredientes.aspx.cs" Inherits="parcial1_9.GestionRecetasIngredientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Cantidad: "></asp:Label>
    <asp:TextBox ID="TextBoxCantidad" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCantidad" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Receta: "></asp:Label>
    <asp:DropDownList ID="DropDownListRecetas" runat="server" DataSourceID="SqlDataSourceRecetas" DataTextField="nombre" DataValueField="id">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListRecetas" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Ingredientes: "></asp:Label>
    <asp:DropDownList ID="DropDownListIngredientes" runat="server" DataSourceID="SqlDataSourceIngredientes" DataTextField="descripcion" DataValueField="id">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListIngredientes" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" Text="Add" />
    <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update" />
    <asp:Label ID="LabelResult" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Filtrar por receta: "></asp:Label>
    <asp:DropDownList ID="DropDownListFiltro" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRecetas" DataTextField="nombre" DataValueField="id">
    </asp:DropDownList>
    <asp:Button ID="ButtonFilter" runat="server" OnClick="ButtonFilter_Click" Text="Filtrar" />
    <asp:Button ID="ButtonUnfilter" runat="server" OnClick="ButtonUnfilter_Click" Text="Desfiltrar" />
    <br />
    <asp:GridView ID="GridViewRecetasIngredientes" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceRecetasIngredientesCRUD" OnSelectedIndexChanged="GridViewRecetasIngredientes_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
            <asp:BoundField DataField="IDReceta" HeaderText="IDReceta" SortExpression="IDReceta" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="IDIngrediente" HeaderText="IDIngrediente" SortExpression="IDIngrediente" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="NumRecetas" HeaderText="NumRecetas" ReadOnly="True" SortExpression="NumRecetas" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSourceIngredientes" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" SelectCommand="SELECT * FROM [Ingredientes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceRecetas" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" SelectCommand="SELECT * FROM [Recetas]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceRecetasIngredientesCRUD" runat="server" ConnectionString="<%$ ConnectionStrings:clase4ConnectionString %>" DeleteCommand="DELETE FROM [RecetaIngredientes] WHERE [id] = @id" InsertCommand="INSERT INTO [RecetaIngredientes] ([cantidad], [idReceta], [idIngrediente]) VALUES (@cantidad, @idReceta, @idIngrediente)" SelectCommand="SELECT 
    ri.id, 
    ri.cantidad, 
    ri.idReceta as IDReceta, 
    r.nombre, 
    ri.idIngrediente as IDIngrediente, 
    i.descripcion, 
    COUNT(ri.idReceta) OVER (PARTITION BY ri.idIngrediente) AS NumRecetas
FROM 
    RecetaIngredientes ri
INNER JOIN 
    Recetas r ON ri.idReceta = r.id
INNER JOIN 
    Ingredientes i ON ri.idIngrediente = i.id
GROUP BY 
    ri.id, ri.cantidad, ri.idReceta, r.nombre, ri.idIngrediente, i.descripcion;" UpdateCommand="UPDATE [RecetaIngredientes] SET [cantidad] = @cantidad, [idReceta] = @idReceta, [idIngrediente] = @idIngrediente WHERE [id] = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridViewRecetasIngredientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxCantidad" Name="cantidad" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownListRecetas" Name="idReceta" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownListIngredientes" Name="idIngrediente" PropertyName="SelectedValue" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBoxCantidad" Name="cantidad" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownListRecetas" Name="idReceta" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownListIngredientes" Name="idIngrediente" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="GridViewRecetasIngredientes" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
