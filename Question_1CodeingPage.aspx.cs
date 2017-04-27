using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Question_1
{
    public partial class Ragistration_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Getgridviewdata();
            }

        }

        private void Getgridviewdata()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "showbookdetails";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            SqlDataReader datareader = cmd.ExecuteReader();
            GridView1.DataSource = datareader;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            if (e.CommandName == "editrow")
            {
                cmd.CommandText = "editbookdetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@bookid", e.CommandArgument);
                SqlDataReader datareader = cmd.ExecuteReader();
                while (datareader.Read())
                {
                    BookNameTextBox.Text = datareader["bookname"].ToString();
                    AuthorTextBox.Text = datareader["bookauthor"].ToString();
                    PublisherTextBox.Text = datareader["bookpublisher"].ToString();
                    PriceTextBox.Text = datareader["bookprice"].ToString();
                }
                Getgridviewdata();
            }
            else if (e.CommandName == "deleterow")
            {
                cmd.CommandText = "deletebookdetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@bookid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                Getgridviewdata();
            }

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int price =Convert.ToInt32(PriceTextBox.Text);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insertbookdetails";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@bookname", BookNameTextBox.Text);
            cmd.Parameters.AddWithValue("@bookauthor", AuthorTextBox.Text);
            cmd.Parameters.AddWithValue("@bookpublisher", PublisherTextBox.Text);
            cmd.Parameters.AddWithValue("@bookprice", price);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Getgridviewdata();
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            BookNameTextBox.Text = "";
            AuthorTextBox.Text = "";
            PublisherTextBox.Text = "";
            PriceTextBox.Text = "";
        }
    }
}
