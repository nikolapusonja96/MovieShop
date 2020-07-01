using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.DataAccess.Configuration
{
    public class MovieConfiguration : IEntityTypeConfiguration<Movie>
    {
        public void Configure(EntityTypeBuilder<Movie> builder)
        {
            builder.Property(x => x.Title)
                .IsRequired()
                .HasMaxLength(30);
            builder.HasIndex(x => x.Title)
                .IsUnique();
            builder.Property(x => x.Description)
                .IsRequired()
                .HasMaxLength(250);

            //n:n Movie:Actor
            builder.HasMany(m => m.MovieActors)
                .WithOne(ma => ma.Movie)
                .HasForeignKey(ma => ma.MovieId)
                .OnDelete(DeleteBehavior.Restrict);

            //n:n Movie:Director
            builder.HasMany(m => m.MovieDirectors)
                .WithOne(md => md.Movie)
                .HasForeignKey(md => md.MovieId)
                .OnDelete(DeleteBehavior.Restrict);

            //n:n Movie:Writer
            builder.HasMany(m => m.MovieWriters)
                .WithOne(mw => mw.Movie)
                .HasForeignKey(mw => mw.MovieId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(m => m.OrderLines)
                .WithOne(ol => ol.Movie)
                .HasForeignKey(ol => ol.MovieId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
