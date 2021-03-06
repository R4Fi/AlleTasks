FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY Rafal.Bochenski.Service3/ Rafal.Bochenski.Service3
COPY Rafal.Bochenski.Service3.Tests Rafal.Bochenski.Service3.Tests

WORKDIR Rafal.Bochenski.Service3/

RUN dotnet restore
RUN dotnet publish -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "Rafal.Bochenski.Service3.dll"]
