using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class addedMovieNumberToWriterAndDirector : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "MovieNumber",
                table: "Writers",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "MovieNumber",
                table: "Directors",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MovieNumber",
                table: "Writers");

            migrationBuilder.DropColumn(
                name: "MovieNumber",
                table: "Directors");
        }
    }
}
