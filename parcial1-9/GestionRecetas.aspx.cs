using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1_9
{
    public partial class GestionRecetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewRecetas.DataBind();
        }

        protected void GridViewRecetas_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxNombre.Text = GridViewRecetas.SelectedRow.Cells[1].Text;
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceRecetasCRUD.Insert();
            if (result > 0)
            {
                LabelResult.Text = $"Se insertaron {result} registro/s";
                GridViewRecetas.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se insertaron registros";
            }
            TextBoxNombre.Text = string.Empty;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceRecetasCRUD.Update();
            if (result > 0)
            {
                LabelResult.Text = $"Se modificaron {result} registro/s";
                GridViewRecetas.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se modificaron registros";
            }
            TextBoxNombre.Text = string.Empty;
        }
    }
}