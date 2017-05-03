
# Pulling a Windows Server 2016 Nano Server with .NET Core 1.1
FROM microsoft/dotnet:1.1-runtime-nanoserver

# Dockerfile author
MAINTAINER Fernando de Oliveira fedeoliv@microsoft.com

# Creating a directory for the application on C:/app
WORKDIR /app/

# Copying all files to new directory C:/app
COPY . .

# Starting Powershell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Copying all C++ dependencies from c:/app/redist to c:\windows\system32
RUN cd c:/app/redist; copy *.* c:\windows\system32

# Running the .NET Core Managed Gateway sample
ENTRYPOINT ["dotnet c:/app/samples/dotnet_core_managed_gateway/bin/Debug/netcoreapp1.1/dotnet_core_managed_gateway.dll c:/app/samples/dotnet_core_managed_gateway/dotnet_core_managed_gateway_win.json"]