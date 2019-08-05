import { APIGatewayProxyHandler } from 'aws-lambda';
import 'source-map-support/register';

export const healtcheck: APIGatewayProxyHandler = async (event, _context) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Healty!',
      input: event,
    }, null, 2),
  };
}
