using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class movedCharachterNameActorToActorMovie : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MovieCharacterName",
                table: "Actors");

            migrationBuilder.AddColumn<string>(
                name: "MovieCharachterName",
                table: "ActorMovie",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MovieCharachterName",
                table: "ActorMovie");

            migrationBuilder.AddColumn<string>(
                name: "MovieCharacterName",
                table: "Actors",
                type: "nvarchar(13)",
                maxLength: 13,
                nullable: false,
                defaultValue: "");
        }
    }
}
