param apimName string = 'Testing003'
param apiName string = 'templateapi'
param displayName string = 'Template API' // Replace with actual display name to be created
param serviceUrl string = 'https://templateapi.com' // Replace with your actual backend service URL
param path string = 'templateapi' // The URL path segment for the API

resource apim 'Microsoft.ApiManagement/service@2021-08-01' existing = {
  name: apimName
}

resource api 'Microsoft.ApiManagement/service/apis@2021-08-01' = {
  name: '${apimName}/${apiName}'
  properties: {
    displayName: displayName
    path: path
    serviceUrl: serviceUrl
    protocols: [
      'https'
    ]
  }
  dependsOn: [
    apim
  ]
}
