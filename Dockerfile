FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

RUN apt-get update && \
    apt install nodejs -y && \
    apt install npm -y

WORKDIR /app
COPY *.sln .

COPY DotnetTemplate.Web/*.csproj ./DotnetTemplate.Web/
COPY DotnetTemplate.Web.Tests/*.csproj ./DotnetTemplate.Web.Tests/

RUN dotnet restore

COPY . /app
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll"]

