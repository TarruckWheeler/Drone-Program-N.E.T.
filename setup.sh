#!/bin/bash

# Drone Program N.E.T - Complete Setup Script
echo "Setting up Drone Program N.E.T project structure..."

# Navigate to your repository (assuming you're already in it)
# If not, uncomment and modify the next two lines:
# git clone https://github.com/TarruckWheeler/Drone-Program-N.E.T.git
# cd Drone-Program-N.E.T

# Create main directory structure
echo "Creating directory structure..."
mkdir -p src/DroneCore/{Models,Controllers,Communication,FlightControl}
mkdir -p src/DroneUI
mkdir -p src/DroneAPI
mkdir -p tests/{DroneCore.Tests,Integration.Tests}
mkdir -p docs
mkdir -p scripts
mkdir -p .github/workflows

# Create solution file
echo "Creating solution file..."
dotnet new sln -n Drone-Program-N.E.T

# Create DroneCore class library
echo "Creating DroneCore project..."
cd src/DroneCore
dotnet new classlib -n DroneCore
cd ../..

# Create DroneUI WPF project
echo "Creating DroneUI project..."
cd src/DroneUI
dotnet new wpf -n DroneUI
cd ../..

# Create DroneAPI Web API project
echo "Creating DroneAPI project..."
cd src/DroneAPI
dotnet new webapi -n DroneAPI
cd ../..

# Create test projects
echo "Creating test projects..."
cd tests/DroneCore.Tests
dotnet new xunit -n DroneCore.Tests
cd ../Integration.Tests
dotnet new xunit -n Integration.Tests
cd ../..

# Add all projects to solution
echo "Adding projects to solution..."
dotnet sln add src/DroneCore/DroneCore.csproj
dotnet sln add src/DroneUI/DroneUI.csproj
dotnet sln add src/DroneAPI/DroneAPI.csproj
dotnet sln add tests/DroneCore.Tests/DroneCore.Tests.csproj
dotnet sln add tests/Integration.Tests/Integration.Tests.csproj

# Add project references
echo "Setting up project references..."
cd src/DroneUI
dotnet add reference ../DroneCore/DroneCore.csproj
cd ../DroneAPI
dotnet add reference ../DroneCore/DroneCore.csproj
cd ../../tests/DroneCore.Tests
dotnet add reference ../../src/DroneCore/DroneCore.csproj
cd ../Integration.Tests
dotnet add reference ../../src/DroneCore/DroneCore.csproj
dotnet add reference ../../src/DroneAPI/DroneAPI.csproj
cd ../..

# Add required NuGet packages to DroneCore
echo "Adding NuGet packages..."
cd src/DroneCore
dotnet add package Microsoft.Extensions.Logging
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Newtonsoft.Json
dotnet add package System.IO.Ports
cd ../..

# Add packages to DroneUI
cd src/DroneUI
dotnet add package Microsoft.Extensions.Logging
dotnet add package Microsoft.Extensions.DependencyInjection
dotnet add package Newtonsoft.Json
cd ../..

# Add packages to DroneAPI
cd src/DroneAPI
dotnet add package Microsoft.Extensions.Logging
dotnet add package Newtonsoft.Json
cd ../..

echo "Project structure created successfully!"
echo "Next steps:"
echo "1. Add the provided C# code files to appropriate directories"
echo "2. Commit and push to GitHub"
echo "3. Set up branch protection rules on GitHub"
echo "4. Start developing your drone control features!"
