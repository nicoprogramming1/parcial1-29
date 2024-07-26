<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="parcial1_9.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Usuario: "></asp:Label>
    <asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxUsuario" Display="None" ErrorMessage="Usuario Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Pass: "></asp:Label>
    <asp:TextBox ID="TextBoxPass1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass1" Display="None" ErrorMessage="Pass1 Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Repita pass:"></asp:Label>
    <asp:TextBox ID="TextBoxPass2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPass2" Display="None" ErrorMessage="Pass 2 Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass1" ControlToValidate="TextBoxPass2" Display="None" ErrorMessage="Las pass deben ser iguales" ForeColor="Red"></asp:CompareValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Edad:"></asp:Label>
    <asp:TextBox ID="TextBoxEdad" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxEdad" Display="None" ErrorMessage="Edad Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxEdad" Display="None" ErrorMessage="Edad debe ser entre 5 y 10" ForeColor="Red" MaximumValue="10" MinimumValue="5"></asp:RangeValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Email: "></asp:Label>
    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Email Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" Display="None" ErrorMessage="Debe ser email" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&amp;amp;'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="None" ErrorMessage="Archivo simple Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="True" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FileUpload2" Display="None" ErrorMessage="Archivo multiple Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Errores: " />
    <br />
    <br />
    <asp:Button ID="ButtonAdd" runat="server" OnClick="ButtonAdd_Click" style="height: 26px" Text="Add" />
    <asp:Label ID="LabelResult" runat="server"></asp:Label>
</asp:Content>
