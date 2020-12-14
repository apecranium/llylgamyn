using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Llylgamyn.Infrastructure.Identity;

namespace Llylgamyn.Infrastructure
{
    public static class IServiceCollectionExtensions
    {
        public static void AddLlylgamynContext(this IServiceCollection services, string connectionString)
        {
            services.AddDbContext<LlylgamynContext>(options =>
                options.UseNpgsql(connectionString));
        }
    }
}
