import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

const _width = 450.0;
const _iconSize = 32.0;
const _animation = AnimationType.fromTop;
const _notificationPosition = NotificationPosition.topCenter;

class Toasts {
  Toasts._();

  static ElegantNotification? _notification;

  static void success({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    _showNotification(
      context: context,
      notification: ElegantNotification.success(
        title: _buildTitle(title),
        description: _buildMessage(message),
        width: _width,
        iconSize: _iconSize,
        animation: _animation,
        notificationPosition: _notificationPosition,
      ),
    );
  }

  static void error({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    _showNotification(
      context: context,
      notification: ElegantNotification.error(
        title: _buildTitle(title),
        description: _buildMessage(message),
        width: _width,
        iconSize: _iconSize,
        animation: _animation,
        notificationPosition: _notificationPosition,
      ),
    );
  }

  static void info({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    _showNotification(
      context: context,
      notification: ElegantNotification.info(
        title: _buildTitle(title),
        description: _buildMessage(message),
        width: _width,
        iconSize: _iconSize,
        animation: _animation,
        notificationPosition: _notificationPosition,
      ),
    );
  }

  static void _showNotification({
    required BuildContext context,
    required ElegantNotification notification,
  }) {
    _notification?.closeOverlay();

    _notification = notification;

    _notification!.show(context);
  }

  static Text _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text _buildMessage(String message) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
