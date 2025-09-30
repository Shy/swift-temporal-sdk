//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Temporal SDK open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift Temporal SDK project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift Temporal SDK project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

extension HistoryEvent.Attributes {
    /// Event attributes for when a child workflow execution has been canceled.
    public struct ChildWorkflowExecutionCanceled: Hashable, Sendable {
        /// Details provided when the child workflow was canceled.
        public var details: [TemporalPayload]

        /// Namespace of the child workflow.
        ///
        /// SDKs and UI tools should use `namespace` field but server must use `namespace_id` only.
        public var namespace: String

        /// The namespace ID of the child workflow.
        public var namespaceID: String

        /// The workflow execution identifier of the child workflow.
        public var workflowExecution: WorkflowExecutionID

        /// The type name of the child workflow.
        public var workflowType: String

        /// Id of the `START_CHILD_WORKFLOW_EXECUTION_INITIATED` event which this event corresponds to.
        public var initiatedEventID: Int

        /// Id of the `CHILD_WORKFLOW_EXECUTION_STARTED` event which this event corresponds to.
        public var startedEventID: Int

        /// Creates event attributes for when a child workflow execution has been canceled.
        public init(
            details: [TemporalPayload],
            namespace: String,
            namespaceID: String,
            workflowExecution: WorkflowExecutionID,
            workflowType: String,
            initiatedEventID: Int,
            startedEventID: Int
        ) {
            self.details = details
            self.namespace = namespace
            self.namespaceID = namespaceID
            self.workflowExecution = workflowExecution
            self.workflowType = workflowType
            self.initiatedEventID = initiatedEventID
            self.startedEventID = startedEventID
        }
    }
}
