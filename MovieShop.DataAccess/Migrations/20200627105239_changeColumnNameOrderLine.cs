using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class changeColumnNameOrderLine : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Name",
                table: "OrderLine");

            migrationBuilder.AddColumn<string>(
                name: "Title",
                table: "OrderLine",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Title",
                table: "OrderLine");

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "OrderLine",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
