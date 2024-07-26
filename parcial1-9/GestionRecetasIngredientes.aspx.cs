using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1_9
{
    public partial class GestionRecetasIngredientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewRecetasIngredientes.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceRecetasIngredientesCRUD.Insert();
            if (result > 0)
            {
                LabelResult.Text = $"Se insertaron {result} registro/s";
                GridViewRecetasIngredientes.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se insertaron registros";
            }
            TextBoxCantidad.Text = string.Empty;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceRecetasIngredientesCRUD.Update();
            if (result > 0)
            {
                LabelResult.Text = $"Se modificaron {result} registro/s";
                GridViewRecetasIngredientes.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se modificaron registros";
            }
            TextBoxCantidad.Text = string.Empty;
        }

        protected void ButtonFilter_Click(object sender, EventArgs e)
        {
            SqlDataSourceRecetasIngredientesCRUD.FilterExpression = "idReceta = " + DropDownListFiltro.SelectedValue;
            GridViewRecetasIngredientes.DataBind();
        }

        protected void ButtonUnfilter_Click(object sender, EventArgs e)
        {
            SqlDataSourceRecetasIngredientesCRUD.FilterExpression = string.Empty;
            SqlDataSourceRecetasIngredientesCRUD.FilterParameters.Clear();
            GridViewRecetasIngredientes.DataBind();
        }

        protected void GridViewRecetasIngredientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxCantidad.Text = GridViewRecetasIngredientes.SelectedRow.Cells[].Text;
            DropDownListIngredientes.SelectedValue = GridViewRecetasIngredientes.SelectedRow.Cells[].Text;
            DropDownListRecetas.SelectedValue = GridViewRecetasIngredientes.SelectedRow.Cells[].Text;
        }
    }
}