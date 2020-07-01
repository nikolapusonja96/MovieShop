using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class ChangeNameOfColumnInActorMovie : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MovieCharachterName",
                table: "ActorMovie");

            migrationBuilder.AddColumn<string>(
                name: "ActorCharachterName",
                table: "ActorMovie",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ActorCharachterName",
                table: "ActorMovie");

            migrationBuilder.AddColumn<string>(
                name: "MovieCharachterName",
                table: "ActorMovie",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
