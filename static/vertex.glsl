uniform mat4 projectoinMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;

void main() {
    gl_Position = projectoinMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}