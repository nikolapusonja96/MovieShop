using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.DataAccess.Configuration
{
    public class WriterConfiguration : IEntityTypeConfiguration<Writer>
    {
        public void Configure(EntityTypeBuilder<Writer> builder)
        {
            builder.Property(x => x.FirstName)
                .IsRequired()
                .HasMaxLength(30);

            builder.Property(x => x.LastName)
                .IsRequired()
                .HasMaxLength(30);

            //n:n Writer:Movie
            builder.HasMany(m => m.WriterMovies)
                .WithOne(wm => wm.Writer)
                .HasForeignKey(wm => wm.WriterId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
