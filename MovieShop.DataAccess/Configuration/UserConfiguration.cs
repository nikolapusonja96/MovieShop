using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.DataAccess.Configuration
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasAlternateKey(x => x.Username);
            
            builder.Property(x => x.Username)
                .HasMaxLength(30);

            builder.Property(x => x.Password)
                .IsRequired()
                .HasMaxLength(16);
            
            builder.Property(x => x.FirstName)
                .IsRequired()
                .HasMaxLength(30);
            
            builder.Property(x => x.LastName)
                .IsRequired()
                .HasMaxLength(30);

            builder.HasIndex(x => x.Email)
                .IsUnique();

            builder.Property(x => x.Email)
                   .IsRequired();

            builder.HasMany(u => u.Orders)
                .WithOne(o => o.User)
                .HasForeignKey(o => o.UserId)
                .OnDelete(DeleteBehavior.Restrict);

        }
    }
}

