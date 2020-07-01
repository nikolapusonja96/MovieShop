using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class addedWriterFullName : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Fullname",
                table: "Writers",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Fullname",
                table: "Writers");
        }
    }
}
