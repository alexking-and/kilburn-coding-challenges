// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "./lib/provable.sol";
import "./lib/strings.sol";

contract Adder is usingProvable {
    using strings for *;

    // Maps input integers to predictions.
    // (keccak256 hash of (x, y) => prediction)
    mapping (bytes => uint) public predictions;

    string apiBaseUrl;

    event Prediction(uint _value);
    event LogProvableQuery(string _message);

    constructor(string memory _apiBaseUrl) public {
        apiBaseUrl = _apiBaseUrl;
    }

    // Request the contract to fetch a update the predictions mapping
    // with a new entry adding the given parameters.
    function requestPrediction(uint _x, uint _y) public payable {
        if (provable_getPrice("URL") > address(this).balance) {
            emit LogProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            string memory path = strConcat(apiBaseUrl, "/add/", uint2str(_x), "/", uint2str(_y));
            string memory jsonHelper = strConcat("json(", path, ").stringResult");
            provable_query("URL", jsonHelper);
            emit LogProvableQuery("Provable query was sent, standing by for the answer..");
        }
    }

    // Retrieve a prediction from the mapping.
    // Returns -1 if entry does not exist.
    function getPrediction(uint _x, uint _y) public returns (int) {
        uint xyPrediction = predictions[abi.encode(_x, _y)];
        uint yxPrediction = predictions[abi.encode(_y, _x)];

        if (xyPrediction != 0) {
            return int(xyPrediction);
        } else if (yxPrediction != 0) {
            return int(yxPrediction);
        } else {
            return -1;
        }
    }

    // Callback utilised to feed new predictions into the mapping.
    function __callback(bytes32 _myid, string memory _result) public override {
        require(msg.sender == provable_cbAddress());
        emit LogProvableQuery(strConcat("Callback called with the following data: ", _result));

        // Parse values from result
        strings.slice memory s = _result.toSlice();
        strings.slice memory delim = ",".toSlice();
        uint[] memory toks = new uint[](s.count(delim));
        for (uint i = 0; i < toks.length; i++) {
            toks[i] = parseInt(s.split(delim).toString());
        }

        // Store into mapping
        predictions[abi.encode(toks[0], toks[1])] = toks[2];
        predictions[abi.encode(toks[1], toks[0])] = toks[2];
        emit Prediction(toks[2]);
    }
}
