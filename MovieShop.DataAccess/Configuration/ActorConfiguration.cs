using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.DataAccess.Configuration
{
    public class ActorConfiguration : IEntityTypeConfiguration<Actor>
    {
        public void Configure(EntityTypeBuilder<Actor> builder)
        {
            builder.Property(x => x.FirstName)
                .IsRequired()
                .HasMaxLength(30);
            builder.Property(x => x.LastName)
                .IsRequired()
                .HasMaxLength(30);
            
            builder.Property(x => x.BirthPlace)
                .IsRequired()
                .HasMaxLength(30);

            builder.Property(x => x.FirstAndLastName)
                .IsRequired()
                .HasMaxLength(70);
            

            //n:n Actor:Movie Relationship
            builder.HasMany(m => m.ActorMovies)
                .WithOne(ma => ma.Actor)
                .HasForeignKey(ma => ma.ActorId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
