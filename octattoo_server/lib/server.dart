import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';

import 'package:octattoo_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

import 'package:mailer/mailer.dart' as mailer;

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  /**
  * * Authentication module configuration
  */
  auth.AuthConfig.set(
    auth.AuthConfig(
        allowUnsecureRandom: false,
        sendValidationEmail: (session, email, validationCode) async {
          // Retrieve the credentials
          final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
          final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

          // Create a SMTP client for Gmail.
          final smtpServer = gmail(gmailEmail, gmailPassword);

          // Create an email message with the validation code.
          final message = mailer.Message()
            ..from = mailer.Address(gmailEmail)
            ..recipients.add(email)
            ..subject = 'Verification code for Serverpod'
            ..html = 'Your verification code is: $validationCode';

          // Send the email message.
          try {
            await mailer.send(message, smtpServer);
          } catch (_) {
            // Return false if the email could not be sent.
            return false;
          }

          return true;
        },
        sendPasswordResetEmail: (session, email, validationCode) async {
          // Send the password reset email to the user.
          // Return `true` if the email was successfully sent, otherwise `false`.
          print("ValidationCode: $validationCode");
          return true;
        },
        onUserCreated: (session, userInfo) async {
          if (userInfo.id != null) {
            final user = User(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              userInfoId: userInfo.id!,
            );
            await User.db.insertRow(session, user);
          }
        }),
  );

  // Start the server.
  await pod.start();
}
