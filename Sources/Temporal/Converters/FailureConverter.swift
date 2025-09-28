//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Temporal SDK open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift Temporal SDK project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift Cassandra Client project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

/// A failure converter transforms between Swift errors and the ``TemporalError``.
///
/// - Important: Payload converters **must be** deterministic since they are called from within a workflow.
public protocol FailureConverter: Sendable {
    /// Converts the given error to a ``TemporalFailure``.
    ///
    /// - Parameter error: The error to convert.
    /// - Parameter payloadConverter: The payload converter to use to encode attributes.
    /// - Returns: The converted failure.
    func convertError(
        _ error: any Error,
        payloadConverter: some PayloadConverter
    ) -> TemporalFailure

    /// Converts the given failure to a Swift error.
    ///
    /// - Parameter temporalFailure: The failure to convert.
    /// - Parameter payloadConverter: The payload converter to use when decoding encoded attributes.
    /// - Returns: The converted error.
    func convertTemporalFailure(
        _ temporalFailure: TemporalFailure,
        payloadConverter: some PayloadConverter
    ) -> any Error
}
