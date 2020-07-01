using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MovieShop.DataAccess.Migrations
{
    public partial class AddedBaseManyToManyEntity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "WriterMovie");

            migrationBuilder.DropColumn(
                name: "DeletedAt",
                table: "WriterMovie");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "WriterMovie");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "WriterMovie");

            migrationBuilder.DropColumn(
                name: "ModifiedAt",
                table: "WriterMovie");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "DirectorMovie");

            migrationBuilder.DropColumn(
                name: "DeletedAt",
                table: "DirectorMovie");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "DirectorMovie");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "DirectorMovie");

            migrationBuilder.DropColumn(
                name: "ModifiedAt",
                table: "DirectorMovie");

            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "ActorMovie");

            migrationBuilder.DropColumn(
                name: "DeletedAt",
                table: "ActorMovie");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "ActorMovie");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "ActorMovie");

            migrationBuilder.DropColumn(
                name: "ModifiedAt",
                table: "ActorMovie");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "WriterMovie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DeletedAt",
                table: "WriterMovie",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "WriterMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "WriterMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedAt",
                table: "WriterMovie",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "DirectorMovie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DeletedAt",
                table: "DirectorMovie",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "DirectorMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "DirectorMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedAt",
                table: "DirectorMovie",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "ActorMovie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DeletedAt",
                table: "ActorMovie",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "ActorMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "ActorMovie",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedAt",
                table: "ActorMovie",
                type: "datetime2",
                nullable: true);
        }
    }
}
