# expo-turtle-builder
Github https://github.com/Steve192/expo-turtle-builder

Docker image to build expo projects for android (iOS planned) without usage of expo.dev services.

This includes the need to publish on expo using `expo publish` (planned feature) aswell as the use of the expo build infrastructure.

When executing expo-turtle-builder, an apk/aab file will be built to `output/android.<aab|apk>`

## Usage

**_Important: run npm i (or npm ci) before calling the expo-turtle-builder_**

Inside container:

```bash
# Needed (planned: only if app not not publicly available at expo.dev)
export EXPO_USERNAME=xxx
export EXPO_PASSWORD=xxx

# Needed if EXPO_USERNAME and EXPO_PASSWORD are not provided or keystore is not stored at expo.dev
export EXPO_ANDROID_KEYSTORE_BASE64=xxx
export EXPO_ANDROID_KEYSTORE_ALIAS=xxx
export EXPO_ANDROID_KEYSTORE_PASSWORD=xxx
export EXPO_ANDROID_KEY_PASSWORD=xxx

expo-turtle-builder  \
    --target <android|ios> \
    --format <apk|app-bundle>  \
    --public-url <optional url> \
```

Using the container

```bash
TODO
```

In gitlab ci

```yaml
build-android:
  stage: build
  image: steve192/expo-turtle-builder
  variables:
    # Token not supported by turtle, store variables in CI variables section of your project
    EXPO_USERNAME: $EXPO_USERNAME
    EXPO_PASSWORD: $EXPO_PASSWORD
  script:
    - npm ci
    - expo-turtle-builder --target android --format app-bundle
  artifacts:
    paths:
      - output/android*

```

In github actions

```yaml
TODO
```

### target

Do you want to build for android or iOS (iOS is not supported yet)

### format

Do you want to build an apk or an app-bundle

### public-url

Provide if you are not providing EXPO_USERNAME or EXPO_PASSWORD to know where your app is hosted.

If you are providing a login, the app.json is used to determine your app, so this parameter is not needed.

If you are not hosting your app on expo.dev, provide this parameter aswell

## ENV Variables

Provide the following env variables:

### `EXPO_USERNAME` (optional)

_Required if public-url is not set or your project is a private expo project_

Your expo username

### `EXPO_PASSWORD` (optional)

_Required if public-url is not set or your project is a private expo project_

[comment]: <> ()

## PLANNED BUT NOT SUPPORTED/TESTED YET:

Your expo password

### `EXPO_ANDROID_KEYSTORE_BASE64` (optional)

_Required if your keystore is not stored at expo.dev_

Your android keystore encoded as base64. To encode your keystore use `echo your_keystore_file | base64 `

### `EXPO_ANDROID_KEYSTORE_ALIAS` (optional)

_Required if your keystore is not stored at expo.dev_

The alias of your key in your keystore

### `EXPO_ANDROID_KEYSTORE_PASSWORD` (optional)

_Required if your keystore is not stored at expo.dev_

Android keystore password

### `EXPO_ANDROID_KEY_PASSWORD` (optional)

_Required if your keystore is not stored at expo.dev_
Android key password
