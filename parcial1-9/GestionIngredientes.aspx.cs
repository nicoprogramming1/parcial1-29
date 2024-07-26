using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1_9
{
    public partial class GestionIngredientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewIngredientes.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceIngredientesCRUD.Insert();
            if (result > 0)
            {
                LabelResult.Text = $"Se insertaron {result} registro/s";
                GridViewIngredientes.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se insertaron registros";
            }
            TextBoxDescripcion.Text = string.Empty;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceIngredientesCRUD.Update();
            if (result > 0)
            {
                LabelResult.Text = $"Se modificaron {result} registro/s";
                GridViewIngredientes.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se modificaron registros";
            }
            TextBoxDescripcion.Text = string.Empty;
        }

        protected void GridViewIngredientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxDescripcion.Text = GridViewIngredientes.SelectedRow.Cells[1].Text;
        }
    }
}