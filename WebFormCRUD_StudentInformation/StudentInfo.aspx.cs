using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormCRUD_StudentInformation
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter adapter;
        DataTable dt;

        public void DataLoad()
        {
            if(Page.IsPostBack)
            {
                dgViewStudents.DataBind();
            }
        }

        public void clearAllData()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = DateTime.Today.Date.ToString();
            ddlGender.SelectedValue = ddlGender.Items[0].ToString();
            chkBoxAgree.Checked = false;
            lblMessage.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void txtDOB_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSID.Text = dgViewStudents.SelectedRow.Cells[1].Text;
            txtName.Text = dgViewStudents.SelectedRow.Cells[2].Text;
            txtEmail.Text = dgViewStudents.SelectedRow.Cells[3].Text;
            ddlGender.Text = dgViewStudents.SelectedRow.Cells[4].Text;
            txtDOB.Text = dgViewStudents.SelectedRow.Cells[5].Text;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(txtName.Text!="" && txtEmail.Text!="" && chkBoxAgree.Checked)
            {
                using(con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("Insert into students (Name, Email, Gender, BirthDate) Values(@name,@email,@gender,@birthdate)", con);
                    cmd.Parameters.AddWithValue("@name",txtName.Text);
                    cmd.Parameters.AddWithValue("@email",txtEmail.Text);
                    cmd.Parameters.AddWithValue("@gender",ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@birthdate", txtDOB.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    clearAllData();
                }
            }
            else
            {
                lblMessage.Text = "Please Fill All Information";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearAllData();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using(con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("Delete from students where StudentId = @studentid", con);
                cmd.Parameters.AddWithValue("@studentid",lblSID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                DataLoad();
                clearAllData();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtEmail.Text != "" && chkBoxAgree.Checked)
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("update students set Name=@name, Email=@email, Gender=@gender, BirthDate=@birthdate where StudentId = @studentid", con);
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@birthdate", txtDOB.Text);
                    cmd.Parameters.AddWithValue("@studentid", lblSID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataLoad();
                    clearAllData();
                }
            }
            else
            {
                lblMessage.Text = "Please Fill All Information";
            }
        }
    }
}