// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.6.0;

contract FraudDetectionSystem {
    struct TransactionEntry {
        uint256[28] features;
        uint256 timestamp;
        uint256 amount;
        uint8 transactionClass;
    }

    mapping(uint256 => TransactionEntry) transactions;
    uint256 public transactionCount;

    /**
     * @dev Function to add a new transaction entry.
     * @param _features Array of 28 uint256 values representing features V1 to V28.
     * @param _timestamp Timestamp representing the time of the transaction.
     * @param _amount Amount of the transaction.
     * @param _transactionClass Class of the transaction (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function addTransactionEntry(
        uint256[28] memory _features,
        uint256 _timestamp,
        uint256 _amount,
        uint8 _transactionClass
    ) public {
        uint256 transactionId = transactionCount++;
        transactions[transactionId] = TransactionEntry(_features, _timestamp, _amount, _transactionClass);
    }

    /**
     * @dev Function to edit an existing transaction entry.
     * @param _transactionId ID of the transaction entry to be edited.
     * @param _features Array of 28 uint256 values representing features V1 to V28.
     * @param _timestamp Timestamp representing the time of the transaction.
     * @param _amount Amount of the transaction.
     * @param _transactionClass Class of the transaction (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function editTransactionEntry(
        uint256 _transactionId,
        uint256[28] memory _features,
        uint256 _timestamp,
        uint256 _amount,
        uint8 _transactionClass
    ) public {
        require(_transactionId < transactionCount, "Transaction ID does not exist");
        transactions[_transactionId] = TransactionEntry(_features, _timestamp, _amount, _transactionClass);
    }

    /**
     * @dev Function to fetch details of a transaction entry by ID.
     * @param _transactionId ID of the transaction entry to fetch.
     * @return features Array of 28 uint256 values representing features V1 to V28.
     * @return timestamp Timestamp representing the time of the transaction.
     * @return amount Amount of the transaction.
     * @return transactionClass Class of the transaction (0 for Legitimate Transaction, 1 for Fraud Transaction).
     */
    function getTransactionEntry(
        uint256 _transactionId
    )
        public
        view
        returns (
            uint256[28] memory features,
            uint256 timestamp,
            uint256 amount,
            uint8 transactionClass
        )
    {
        require(_transactionId < transactionCount, "Transaction ID does not exist");
        TransactionEntry memory entry = transactions[_transactionId];
        return (entry.features, entry.timestamp, entry.amount, entry.transactionClass);
    }
}
