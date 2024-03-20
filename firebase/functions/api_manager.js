const axios = require("axios").default;
const qs = require("qs");

async function _nearbyPlaceCall(context, ffVariables) {
  var query = ffVariables["query"];
  var location = ffVariables["location"];
  var radius = ffVariables["radius"];
  var key = ffVariables["key"];

  var url = `https://maps.googleapis.com/maps/api/place/textsearch/json`;
  var headers = { "Access-Control-Allow-Origin": `*` };
  var params = { query: query, location: location, radius: radius, key: key };
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _directionCall(context, ffVariables) {
  var origin = ffVariables["origin"];
  var destination = ffVariables["destination"];
  var mode = ffVariables["mode"];
  var waypoint = ffVariables["waypoint"];
  var key = ffVariables["key"];

  var url = `https://maps.googleapis.com/maps/api/place/directions/json`;
  var headers = { "Access-Control-Allow-Origin": `*` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _directionDetailsCall(context, ffVariables) {
  var url = `https://maps.googleapis.com/maps/api/place/details/json`;
  var headers = { "Access-Control-Allow-Origin": `*` };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
  });
}
async function _createEventCall(context, ffVariables) {
  var ipAddress = ffVariables["ipAddress"];
  var loginId = ffVariables["loginId"];
  var sessionId = ffVariables["sessionId"];
  var regionalTime = ffVariables["regionalTime"];
  var dowellTime = ffVariables["dowellTime"];
  var location = ffVariables["location"];

  var url = `https://uxlivinglab.pythonanywhere.com/create_event`;
  var headers = { "Access-Control-Allow-Origin": `*` };
  var params = {};
  var ffApiRequestBody = `
{
  "platformcode": "FB",
  "citycode": "101",
  "daycode": "0",
  "dbcode": "pfm",
  "ip_address": "${ipAddress}",
  "login_id": "${loginId}",
  "session_id": "${sessionId}",
  "processcode": "1",
  "location": "${location}",
  "objectcode": "1",
  "instancecode": "100051",
  "context": "afdafa ",
  "document_id": "3004",
  "rules": "some rules",
  "status": "work",
  "data_type": "learn",
  "purpose_of_usage": "add",
  "colour": "color value",
  "hashtags": "hash tag alue",
  "mentions": "mentions value",
  "emojis": "emojis",
  "bookmarks": "a book marks"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    NearbyPlaceCall: _nearbyPlaceCall,
    DirectionCall: _directionCall,
    DirectionDetailsCall: _directionDetailsCall,
    CreateEventCall: _createEventCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
