function handler(event) {
  var request = event.request;
  var uri = request.uri;
  var host = request.headers.host.value;

  if (host.startsWith('www.')) {
    return {
      statusCode: 302,
      statusDescription: 'Found',
      headers: {
        location: {
          value: `https://typescript.odone.me${uri}`
        }
      }
    };
  }

  if (uri.endsWith('/')) {
    request.uri += 'index.html';
  } else if (!uri.includes('.')) {
    request.uri += '/index.html';
  }

  return request;
}
